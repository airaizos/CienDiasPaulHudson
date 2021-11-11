//
//  SegundaVista.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

struct SegundaVista: View {
    @Environment(\.presentationMode) var modoPresentacion
    
    var nombre: String
    
    var body: some View {
        VStack {
            Text("Hola \(nombre)")
            Text("Segunda Vista")
            Button("Dismiss") {
                
                modoPresentacion.wrappedValue.dismiss()
            }
            
        }
    }
}

struct SegundaVista_Previews: PreviewProvider {
    static var previews: some View {
        SegundaVista(nombre: "Adrian")
    }
}
