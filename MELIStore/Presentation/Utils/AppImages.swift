//
//  AppImages.swift
//  MELIStore
//
//  Created by Andres Duque on 7/04/25.
//

import Foundation
import MELIStoreDesignSystem

/// Enum que centraliza el acceso a imágenes del proyecto utilizando nombres tipados.
///
/// Conforma el protocolo `ImageProtocol`, permitiendo acceder de manera segura
/// y estructurada a imágenes del asset catalog.
//
/// ### Propiedades:
/// - `name`: Nombre del recurso en el catálogo de imágenes.
/// - `bundle`: Bundle en el que se encuentra la imagen (por defecto `.main`).
enum AppImages: ImageProtocol {
    case splash
    
    /// Nombre del recurso gráfico en el catálogo de imágenes.
    var name: String {
        switch self {
            case .splash: return "Splash"
        }
    }
    
    /// Bundle que contiene el recurso. Por defecto, el principal.
    var bundle: Bundle? { .main }
}
