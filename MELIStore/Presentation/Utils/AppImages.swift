//
//  AppImages.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import Foundation
import MELIStoreDesignSystem

enum AppImages: ImageProtocol {
    case splash
    
    var name: String {
        switch self {
            case .splash: return "Splash"
        }
    }
    
    var bundle: Bundle? { .main }
    
}
