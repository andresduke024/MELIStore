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

```
//  Config.xcconfig
//  MELIStore
//
//  Created by Xcode automatically.
//

// Configuration settings file format documentation can be found at:
// https://developer.apple.com/documentation/xcode/adding-a-build-configuration-file-to-your-project

ACCESS_TOKEN = YOUR_ACCESS_TOKEN

BASE_URL = BASE_SERVICES_URL_FOR_ENVIRONMENT
```