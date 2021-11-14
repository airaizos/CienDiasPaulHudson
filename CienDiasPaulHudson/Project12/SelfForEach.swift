//
//  SelfForEach.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/11/21.
//

import SwiftUI

struct Estudiante: Hashable {
    let nombre: String
}


struct SelfForEach: View {
    let estudiantes = [Estudiante(nombre: "Harry Potter"), Estudiante(nombre: "Hermione Granger")]
    
    var body: some View {
        VStack {
            
            List {
                ForEach([2,4,6,8,10], id: \..self) {
                    Text("\($0) es par")
                }
            }
            
            List(estudiantes, id:\.self) { estudiante in Text(estudiante.nombre)
            }
        }
    }
}

struct SelfForEach_Previews: PreviewProvider {
    static var previews: some View {
        SelfForEach()
    }
}
