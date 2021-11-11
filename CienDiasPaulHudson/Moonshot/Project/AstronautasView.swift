//
//  AstronautasView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 12/10/21.
//

import SwiftUI

struct AstronautasView: View {
    
    let astronauta: Astronauta
    
    /*
     Cómo conectar los astronautas con las misiones??
     */
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(astronauta.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(astronauta.description)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronauta.name), displayMode: .inline)
    }
    
    
    
}

struct AstronautasView_Previews: PreviewProvider {
    /*
     inicializamos para que tenga algo que mostrar. busca en el Json el num 1
     */
    static var astronautas: [Astronauta] = Bundle.main.decodifica("astronauts.json")
    static var previews: some View {
        AstronautasView(astronauta: astronautas[1])
    }
}
