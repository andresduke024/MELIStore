//
//  MELIStoreApp.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreProducts

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
            case .products: ProductsModuleRoute()
        }
    }
}
