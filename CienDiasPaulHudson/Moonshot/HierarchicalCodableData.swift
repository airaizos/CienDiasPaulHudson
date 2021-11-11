//
//  HierarchicalCodableData.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/10/21.
//

import SwiftUI

struct Usuario: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}



struct HierarchicalCodableData: View {
    var body: some View {
        Button("Decodifica ese JSON") {
            let input = """
                {
                "name": "Taylor Swift",
                "address": {
                    "street": "666, Taylor Swift Avenue",
                    "city": "Garrapinillos"
        }
    }
    """
            let dato = Data(input.utf8)
            let decodificador = JSONDecoder()
            if let usuario = try? decodificador.decode(Usuario.self, from: dato) {
                print(usuario.address.street)
            }
        }
    }
}
    struct HierarchicalCodableData_Previews: PreviewProvider {
        static var previews: some View {
            HierarchicalCodableData()
        }
    }
