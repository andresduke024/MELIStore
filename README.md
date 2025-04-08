# MELI Store (Andres Duque)

**MELI Store** es una aplicación iOS desarrollada con Xcode que permite buscar productos de forma rápida y eficiente. Su objetivo es ofrecer una experiencia fluida para explorar información detallada sobre distintos productos.

## Características

- Búsqueda rápida de productos
- Interfaz amigable y moderna
- Arquitectura modular y escalable

## Archivos `.env`

Este proyecto utiliza archivos `.env` para manejar variables de entorno sensibles como claves de API u otras configuraciones que no deben ser compartidas públicamente.

- Los archivos `.env` deben estar ubicados en la raíz del proyecto.
- **No deben ser incluidos en ningún commit.**
- Asegúrate de contar con un `.env` y un `.env.dev` en tu entorno local. Estos se usarán dependendiendo del `schema` de compilación que uses en el proyecto.

### Plantilla para archivos `.env`

```env
//  Config.xcconfig
//  MELIStore
//
//  Created by Xcode automatically.
//

ACCESS_TOKEN = YOUR_ACCESS_TOKEN
BASE_URL = YOUR_SERVICES_BASE_URL
```

**NOTA: Esta plantilla ya se encuentra creada en el proyecto**

# 🚀 Setup Automático con Makefile

Este proyecto utiliza un archivo `Makefile` para configurar el entorno de desarrollo de forma automática y segura. Incluye herramientas como `SwiftLint`, `pre-commit`, hooks de Git, y manejo de archivos `.env`.

---

## 🛠 Requisitos Previos

- macOS con [Homebrew](https://brew.sh/) instalado.
- Git.
- Swift >= 5.9.
- Swift Package Manager (SPM).
- `make` — disponible por defecto en macOS.

---

## ⚙️ ¿Qué hace el `Makefile`?

Con solo ejecutar `make`, se realizan las siguientes acciones:

### 🔹 1. `swiftlint`
Verifica si `SwiftLint` está instalado, y si no lo está, lo instala con Homebrew.

> SwiftLint es una herramienta que verifica el estilo de tu código Swift según convenciones definidas.

---

### 🔹 2. `precommit`
Verifica si `pre-commit` está instalado, lo instala si es necesario y configura un hook de pre-commit automático.

> `pre-commit` permite validar código antes de hacer commits. En este proyecto se encarga de:
> - Ejecutar `swiftlint` sobre los archivos modificados.

---

### 🔹 3. `prepush`
Crea un hook de Git llamado `pre-push`, que se activa automáticamente antes de realizar un `git push`.

Este hook:
- Corre `pre-commit` en todos los archivos.
- Ejecuta los tests con `swift test`.
- Si algo falla, el push se cancela.

---

### 🔹 4. `env`
Verifica si los archivos `.env` y `.env.dev` existen. Si no están presentes, los crea copiando desde `.env.template`.

> Esto asegura que todos los desarrolladores tengan archivos de entorno configurados correctamente desde el inicio.

---

### 🔹 5. `lint-fix`
Comandos adicionales:

- `make lint-fix`: intenta corregir errores de lint automáticamente usando `swiftlint --fix`.

---

## 🧪 Uso del `Makefile`

### 👉 Configuración inicial

Solo es necesario que ejecutes el comando "make" en tu terminal **(sobre la raíz del proyecto)** y las configuraciones descritas anteriormente seran aplicadas al proyecto.

```bash
make
```

## 📁 Estructura esperada

Asegurate de que siempre existan los siguientes archivos en el proyecto:

```
├── Makefile
├── .swiftlint.yml
├── .env.template
├── .pre-commit-config.yaml
├── scripts/
│   └── pre-push
```

## ⚠️ Problemas comunes

- Si ves errores como **Permission denied** al ejecutar los hooks, ejecuta lo siguiente:

    ```bash
    chmod +x scripts/pre-push
    ```

- **SwiftLint no encuentra el archivo de configuración:**
Asegurate de que .swiftlint.yml esté en la raíz del proyecto.

- **Errores al hacer push:**
El hook de pre-push cancela el push si falla un test o hay errores de lint. Corregilos antes de volver a intentar.

## 🙌 Créditos
Este setup fue diseñado para automatizar al máximo el flujo de trabajo de este proyecto. Pensado especialmente para mantener consistencia, calidad y productividad desde el primer make.

Desarrollado por **Andrés Duque**.