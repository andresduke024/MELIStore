//
//  MELIStoreApp.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftUI
import MELIStoreCore

@main
struct MELIStoreApp: App {
    
    init() {
        ProjectBuilder.shared.build()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
