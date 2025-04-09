//
//  MELIStoreProjectBuilder.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import MELIStoreProducts
import SwiftDependencyInjector

/// Encargado de configurar e inicializar los módulos principales del proyecto.
///
/// Implementa un patrón singleton mediante la propiedad `shared`
/// y se encarga de registrar todas las dependencias necesarias para el proyecto
/// utilizando `SwiftDependencyInjector`.
///
/// Su uso permite encapsular la inicialización y configuración de los distintos módulos
/// (`CoreModule`, `ProductsModule`, etc.) de forma centralizada.
struct ProjectBuilder: Sendable {
    
    /// Instancia compartida del builder.
    static let shared = ProjectBuilder()
    
    /// Inicializa y configura las dependencias de todos los módulos.
    func build() {
        Injector.global.turnOffLogger(forced: true)
        
        let modules: [BasicModuleProtocol] = [
            CoreModule.shared,
            ProductsModule.shared
        ]
        
        for module in modules {
            module.dependenciesContainer.registerDependencies()
        }
    }
}
