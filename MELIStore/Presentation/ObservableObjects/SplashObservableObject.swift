//
//  SplashObservableObject.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import Observation

@Observable
@MainActor
final class SplashObservableObject {
    
    var route: ModulesRoutes?
    
    func start() async {
        try? await Task.sleep(for: .seconds(1))
        
        route = .products
    }
}
