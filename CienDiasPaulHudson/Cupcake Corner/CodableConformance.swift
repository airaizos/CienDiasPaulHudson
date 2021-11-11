//
//  CodableConformance.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
// https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties

import SwiftUI

struct CodableConformance: View {
    
    class Usuario: ObservableObject, Codable {
      //  var nombre = "Adrián Iraizos"
        //@Published var nombre = "Adrián Iraizos" POR SI SOLO NO COMPILA
        enum CodingKeys: CodingKey {
            case nombre
        }
        @Published var nombre = "Adrián Iraizos"
        
        required init(from decoder: Decoder) throws {
            let contenedor = try decoder.container(keyedBy: CodingKeys.self)
            nombre = try contenedor.decode(String.self, forKey: .nombre)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(nombre, forKey: .nombre)
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct CodableConformance_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformance()
    }
}
