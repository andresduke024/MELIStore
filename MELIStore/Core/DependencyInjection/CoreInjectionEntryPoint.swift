//
//  CoreInjectionEntryPoint.swift
//  MELIStore
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftDependencyInjector

struct CoreInjectionEntryPoint: InjectionEntryPoint {
    func start() {
        Injector.global.register(EnvironmentValuesProtocol.self) { EnvironmentValues() }
    }
}
