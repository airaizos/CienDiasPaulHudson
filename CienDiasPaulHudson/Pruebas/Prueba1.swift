//
//  Prueba1.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 2/10/21.
//

import SwiftUI

struct Prueba1: View {
    @State private var mostrar = true
    

    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink("Localized", destination: Prueba2())
                
                NavigationLink(
                    destination: Prueba2(),
                    isActive: $mostrar) {
                    Button(action:{mostrar = true }){
                        Text("as")
                    }
                }
            }
        }
    }
}

struct Prueba1_Previews: PreviewProvider {
    static var previews: some View {
        Prueba1()
    }
}
