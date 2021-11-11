//
//  Misiones.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 12/10/21.
//

import Foundation

struct Misión: Codable, Identifiable {
    //nested struct, and is simply one struct placed inside of another. 
    struct Tripulación: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date? //antes era: String?
    let crew: [Tripulación]
    let description: String
    
    /*
     Generamos un computed property para obtener las imágenes y cómo queremos mostrar el nombre usando el id que es el identificador de la misión
     */
    var nombreMostrado: String {
        "Apollo \(id)"
    }
    var imagen: String {
        "apollo\(id)"
    }
    
    var fechaLanzamientoFormateada: String {
        if let fechaLanzamiento = launchDate {
            let formateador = DateFormatter()
            formateador.dateStyle = .long
            return formateador.string(from: fechaLanzamiento)
        } else {
            return "N/A"
        }
    }
}
