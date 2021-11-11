//
//  Listadoview.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 12/10/21.
//

import SwiftUI

struct Listadoview: View {
    let astronautas: [Astronauta] =  Bundle.main.decodifica("astronauts.json")
    let misiones: [Misión] = Bundle.main.decodifica("missions.json")
    
    var body: some View {
       
            List(misiones) { misión in
                NavigationLink(
                    destination: MisionView(misión: misión, astronautas: self.astronautas)) {
                    Image(misión.imagen)
                        .resizable()
                       // .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width:44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(misión.nombreMostrado)
                            .font(.headline)
                        Text(misión.fechaLanzamientoFormateada)
                    }
                }
            
            .navigationBarTitle("Moonshot")
        }
    }
}

struct Listadoview_Previews: PreviewProvider {
    static var previews: some View {
        Listadoview()
    }
}
