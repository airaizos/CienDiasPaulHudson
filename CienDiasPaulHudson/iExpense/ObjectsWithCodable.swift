//
//  ObjectsWithCodable.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

struct Persona: Codable {
    var nombre: String
    var primerApellido: String
    var segundoApellido: String
}

struct ObjectsWithCodable: View {
    @State private var usuario = Persona(nombre: "Adrián", primerApellido: "Iraizos", segundoApellido: "Mendoza")
    
    var body: some View {
        Button("Guardar usuario") {
            let codificador = JSONEncoder()
            if let datos = try? codificador.encode(usuario) {
                UserDefaults.standard.set(datos, forKey: "DatosUsuario")
            }
            
        }
    }
}

struct ObjectsWithCodable_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsWithCodable()
    }
}
