//
//  ModulesRoutes.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import MELIStoreCore

/// Enum que define las rutas disponibles entre módulos de la aplicación.
///
/// Implementa el protocolo `RouteProtocol`, lo que permite que
/// sea utilizado por el sistema de navegación centralizado ( `NavigationModule` o `Router`).
///
/// ### Casos:
/// - `products`: Ruta que lleva al flujo de productos (`ProductsModule`).
enum ModulesRoutes: RouteProtocol {
    case products
}
