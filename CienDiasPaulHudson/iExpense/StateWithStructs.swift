//
//  StateWithStructs.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI


struct StructUsuario {
    var nombre = "Adrián"
    var apellido = "Adrino"
}

class ClassUsuario: ObservableObject {
    @Published var nombre = "Adrián"
    @Published var apellido = "Adrino"
}

struct StateWithStructs: View {
    @State private var  structUsuario = StructUsuario()
    @ObservedObject var classUsuario = ClassUsuario()
    @State private var mostrar = false
    
    var body: some View {
        VStack {
            Group {
                Text("(STRUCT) Tu nombre es: \(structUsuario.nombre) \(structUsuario.apellido)")
                
                TextField("Nombre", text: $structUsuario.nombre)
                TextField("Apellido", text: $structUsuario.apellido)
            }
            Group {
                Text("(CLASS) Tu nombre es: \(classUsuario.nombre) \(classUsuario.apellido)")
                TextField("Nombre", text: $classUsuario.nombre)
                TextField("Apellido", text:$classUsuario.apellido)
            }
            Group {
                Button("mostrar segunda vista"){
                    mostrar.toggle()
                }
                .sheet(isPresented: $mostrar, content: {
                    //contenido del sheet
                    
                    SegundaVista(nombre:"\(classUsuario.nombre)")
                })
            }
            
            
        }
    }
}

struct StateWithStructs_Previews: PreviewProvider {
    static var previews: some View {
        StateWithStructs()
    }
}
