# MELIStore

**MELIStore** es una aplicación iOS moderna, modular y altamente escalable, diseñada para ofrecer una experiencia fluida en la búsqueda y visualización de productos. Este proyecto está construido siguiendo prácticas avanzadas de arquitectura de software, herramientas de automatización y principios de diseño profesional.



## 🧱 Arquitectura Modular con SPM

MELIStore adopta una arquitectura modular utilizando **Swift Package Manager (SPM)**, lo que permite una estructura de proyecto limpia, desacoplada y fácil de escalar.

### Paquetes principales:

- **MELIStoreCore**  
  Contiene todos los comportamientos generales del dominio del negocio. Aquí se encapsulan los modelos, contratos y servicios compartidos por los distintos módulos de la app.

- **MELIStoreDesignSystem**  
  Centraliza todos los estilos, componentes visuales reutilizables, colores, tipografías y temas de marca. Este paquete permite mantener la coherencia visual en toda la aplicación.

---

## 🔍 Submódulo de Productos

El submódulo `MELIStoreProducts` se encarga de las siguientes funcionalidades clave:

- **Búsqueda de productos**
- **Visualización de resultados**
- **Detalle de producto**

Este módulo funciona de manera independiente y desacoplada, consumiendo únicamente dependencias del `Core` y el `DesignSystem`.

---

## 🧹 Principios de diseño aplicados

Cada submódulo está implementado siguiendo los siguientes principios:

- ✅ **Arquitectura limpia** basada en DDD (Domain-Driven Design)
- ✅ **Diseño atómico de interfaces**
- ✅ **Inyección de dependencias** mediante [`SwiftDependencyInjector`](https://github.com/andresduke024/SwiftDependencyInjector) (también desarrollado por el autor del proyecto)
- ✅ **Tests unitarios completos** que garantizan el correcto funcionamiento de cada feature

---

## ⚙️ Automatización y herramientas de desarrollo

El proyecto está equipado con una serie de herramientas y configuraciones que mejoran el flujo de trabajo del desarrollo:

- **Git hooks** automatizados con `pre-commit`
- **Linting automático** con `SwiftLint`
- **Archivos `.env`** para manejar configuraciones sensibles por entorno
- **Schemas de compilación personalizados**
- **Inicialización del proyecto con `make`**  
  El archivo `Makefile` ya está preparado para ejecutar comandos como:

  ```bash
  make setup
  make test
  make lint
  ```

---

## Características

- **Búsqueda Rápida de Productos**: Permite a los usuarios encontrar productos de manera ágil y eficiente.
- **Interfaz Amigable y Moderna**: Diseñada para ofrecer una experiencia de usuario intuitiva y atractiva.
- **Arquitectura Modular y Escalable**: Facilita la mantenibilidad y expansión de la aplicación.

## Requisitos del Sistema

- **Plataforma**: iOS 17.0 o superior
- **Lenguaje**: Swift 6.0 o superior
- **Dependencias**:
  - [MELIStoreCore](https://github.com/andresduke024/MELIStoreCore/tree/feature/initial): Proporciona funcionalidades esenciales y modelos de datos.
  - [MELIStoreProducts](https://github.com/andresduke024/MELIStoreProducts/tree/feature/initial): Gestiona la lógica relacionada con los productos.
  - [MELIStoreDesignSystem](https://github.com/andresduke024/MELIStoreDesignSystem/tree/feature/initial): Ofrece componentes de interfaz de usuario reutilizables y estilos coherentes.
  - [Alamofire](https://github.com/Alamofire/Alamofire): Maneja operaciones de red de manera sencilla y eficiente.
  - [SwiftLint](https://github.com/realm/SwiftLint): Mantiene un estilo de código coherente en Swift.

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
│   └── check-xcconfig.sh
```

## ⚠️ Problemas comunes

- Si ves errores como **Permission denied** al ejecutar los hooks, ejecuta lo siguiente:

    ```bash
    chmod +x scripts/pre-push
    chmod +x scripts/check-xcconfig.sh
    ```

- **SwiftLint no encuentra el archivo de configuración:**
Asegurate de que .swiftlint.yml esté en la raíz del proyecto.

- **Errores al hacer push:**
El hook de pre-push cancela el push si falla un test o hay errores de lint. Corregilos antes de volver a intentar.

## 🙌 Créditos
Este setup fue diseñado para automatizar al máximo el flujo de trabajo de este proyecto. Pensado especialmente para mantener consistencia, calidad y productividad desde el primer make.

Desarrollado por **Andrés Duque**.

## 🖼️ Atribuciones de ilustraciones

Las ilustraciones utilizadas en este proyecto son proporcionadas por [Storyset](https://storyset.com):

- <a href="https://storyset.com/media">Media illustrations by Storyset</a>  
- <a href="https://storyset.com/online">Online illustrations by Storyset</a>  
- <a href="https://storyset.com/web">Web illustrations by Storyset</a>  
- <a href="https://storyset.com/internet">Internet illustrations by Storyset</a>  

