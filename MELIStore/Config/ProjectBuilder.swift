//
//  MELIStoreProjectBuilder.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import MELIStoreProducts

struct ProjectBuilder: Sendable {
    static let shared = ProjectBuilder()
    
    func build() {
        let modules: [ModuleProtocol] = [
            CoreModule.shared,
            ProductsModule.shared
        ]
        
        for module in modules {
            module.dependenciesContainer.registerDependencies()
        }
    }
}
