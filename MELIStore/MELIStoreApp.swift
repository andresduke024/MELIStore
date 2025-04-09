//
//  MELIStoreApp.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreProducts

/// `MELIStoreApp` es el punto de entrada de la aplicación MELIStore.
///
/// En su inicialización, ejecuta el `ProjectBuilder` que configura el entorno global,
/// y establece un `Router` observable que se comparte como `@EnvironmentObject`.
///
/// La interfaz principal se renderiza dentro de `NavigationModule`, lo cual permite
/// realizar una navegación modular entre diferentes secciones de la app.
///
/// ### Navegación Soportada:
/// - `.products`: Presenta la vista principal del módulo de productos (`ProductsModule.shared.entryPoint`).
@main
struct MELIStoreApp: App {

    @StateObject
    private var router = Router()
    
    init() {
        ProjectBuilder.shared.build()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationModule(onNavigateTo: onNavigateTo(_:)) {
                SplashView()
            }
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private func onNavigateTo(_ route: ModulesRoutes) -> some View {
        switch route {
            case .products: ProductsModule.shared.entryPoint
        }
    }
}
