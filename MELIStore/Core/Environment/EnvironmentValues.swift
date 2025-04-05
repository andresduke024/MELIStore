//
//  EnvironmentValues.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import Foundation
import SwiftDependencyInjector

struct EnvironmentValues: EnvironmentValuesProtocol {
    
    private var environment: [String: Any] {
        guard let plist = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        guard let global = plist["Environment"] as? [String : Any] else {
            fatalError("GlobalVariables not set in plist")
        }

        return global
    }
    
    init() {}
    
    func get<T>(_ key: EnvironmentValueType) -> T {
        guard let data = environment[key.rawValue], let value = data as? T else {
            fatalError("Environment value with key \(key.rawValue) not founded")
        }
        
        return value
    }
}
