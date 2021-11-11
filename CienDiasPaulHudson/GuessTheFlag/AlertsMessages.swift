//
//  AlertsMessages.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct AlertsMessages: View {
    @State private var mostrarAlerta = false
    
    var body: some View {
        Button("Mostrar Alerta") {
            mostrarAlerta = true
        }
        .alert(isPresented: $mostrarAlerta) {
            Alert(title: Text("Alerta"), message: Text("detalle"), dismissButton: .default(Text("Entendido")))
        }
    }
}

struct AlertsMessages_Previews: PreviewProvider {
    static var previews: some View {
        AlertsMessages()
    }
}
