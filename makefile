.PHONY: default setup swiftlint precommit env

default: setup

setup: swiftlint precommit prepush env
	@echo "✅ Entorno completamente configurado"

swiftlint:
	@echo "🔍 Verificando SwiftLint..."
	@if ! command -v swiftlint > /dev/null; then \
		echo "🚫 SwiftLint no está instalado. Instalando..."; \
		brew install swiftlint; \
	else \
		echo "✅ SwiftLint ya está instalado"; \
	fi

precommit:
	@echo "🔍 Verificando pre-commit..."
	@if ! command -v pre-commit > /dev/null; then \
		echo "🚫 pre-commit no está instalado. Instalando..."; \
		brew install pre-commit; \
	else \
		echo "✅ pre-commit ya está instalado"; \
	fi
	@echo "🔧 Configurando hooks de pre-commit..."
	@pre-commit install

prepush:
	@echo "🔧 Instalando hook de pre-push..."
	@mkdir -p .git/hooks
	@cp scripts/pre-push .git/hooks/pre-push
	@chmod +x .git/hooks/pre-push
	@echo "✅ Hook de pre-push instalado correctamente"


lint-fix:
	@echo "🛠 Corrigiendo errores con SwiftLint..."
	@swiftlint --fix --config .swiftlint.yml

env:
	@echo "🔍 Verificando archivos de entorno..."
	@if [ ! -f .env ]; then \
		echo "📄 Creando archivo .env desde .env.template"; \
		touch .env; \
		cp .env.template .env; \
	else \
		echo "✅ Archivo .env ya existe"; \
	fi
	@if [ ! -f .env.dev ]; then \
		echo "📄 Creando archivo .env.dev desde .env.template"; \
		touch .env.dev; \
		cp .env.template .env.dev; \
	else \
		echo "✅ Archivo .env.dev ya existe"; \
	fi
