//
//  ModifyingProgramState.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 10/9/21.
//

import SwiftUI

struct ModifyingProgramState: View {
    let estudiantes = ["Harry","Hermione","Ron"]
    @State private var estudianteElegido = "Harry"
    
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        VStack {
            Button("Tap Count \(tapCount)") {
                tapCount += 1
            }
            Form {
                TextField("Enter your name", text: $name)
                Text("Tu nombre es: \(name)")
            }
            Form {
                Picker("Elige", selection: $estudianteElegido) {
                    ForEach(0..<estudiantes.count) {
                        Text(estudiantes[$0])
                    }
                }
            }
        }
    }
}




struct ModifyingProgramState_Previews: PreviewProvider {
    static var previews: some View {
        ModifyingProgramState()
    }
}
