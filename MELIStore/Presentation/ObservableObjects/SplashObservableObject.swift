//
//  SplashObservableObject.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import Observation

/// ObservableObject que maneja la lógica de navegación desde la pantalla de Splash.
///
/// Es responsable de controlar el flujo de inicio de la app.
/// Simula una espera inicial (como si fuera una carga o validación) y luego define la
/// ruta de navegación.
@Observable
@MainActor
final class SplashObservableObject {
    
    /// Ruta a navegar luego de la espera inicial.
    var route: ModulesRoutes?
    
    /// Simula una carga inicial y establece la ruta hacia `products`.
    func start() async {
        try? await Task.sleep(for: .seconds(1))
        
        route = .products
    }
}
