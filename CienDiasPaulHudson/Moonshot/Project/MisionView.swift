//
//  MisionView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 12/10/21.
//

import SwiftUI

struct MisionView: View {
    let misión: Misión
    
    /*
     creamos este struct para conectar las misiones con los astronautas
     */
    struct Tripulación {
        let role: String
        let astronaut: Astronauta
    }
    
    let astronautas: [Tripulación]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(misión.imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                    Text(misión.fechaLanzamientoFormateada)
                        .font(.title3)
                    Text(misión.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.astronautas, id:\.role) {
                        tripulación in
                        NavigationLink(
                            destination: AstronautasView(astronauta: tripulación.astronaut)) {
                            
                        
                        
                        HStack {
                            Image(tripulación.astronaut.id)
                                .resizable()
                                .frame(width: 100, height: 72)
                                .clipShape(Circle())
                                .overlay(Circle()
                                .stroke(Color.primary,lineWidth: 1))
                                
                            VStack(alignment: .leading) {
                                
                                Text(tripulación.astronaut.name)
                                    .font(.headline)
                                Text(tripulación.role)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(misión.nombreMostrado), displayMode: .inline)
    }
    /*
     Inicializa todos los astronautas para buscar aquien esté en cada misión
     */
    
    init(misión: Misión, astronautas: [Astronauta]) {
        self.misión = misión
        
        var coincidentes = [Tripulación]()
        for miembro in misión.crew {
            if let coincide = astronautas.first(where: { $0.id == miembro.name }) {
                coincidentes.append(Tripulación(role: miembro.role, astronaut: coincide))
            } else {
                fatalError("Missing \(miembro)")
            }
        }
        self.astronautas = coincidentes
    }
}

struct MisionView_Previews: PreviewProvider {
    static let astronautas: [Astronauta] = Bundle.main.decodifica("astronauts.json")
    static let misiones: [Misión] = Bundle.main.decodifica("missions.json")
    static var previews: some View {
        MisionView(misión: misiones[5],astronautas: astronautas)
    }
}
