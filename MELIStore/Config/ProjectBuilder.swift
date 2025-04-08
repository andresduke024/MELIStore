//
//  MELIStoreProjectBuilder.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import MELIStoreProducts
import SwiftDependencyInjector

struct ProjectBuilder: Sendable {
    static let shared = ProjectBuilder()
    
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
