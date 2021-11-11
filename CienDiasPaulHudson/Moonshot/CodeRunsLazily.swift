//
//  CodeRunsLazily.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/10/21.
//

import SwiftUI

struct TextoPersonalizado: View {
    
    var texto: String
    static var num = 0
    var body: some View {
        Text("\(texto) - \(TextoPersonalizado.num)")
        
    }
    
    init(_ texto: String) {
        print("Creando un nuevo Texto Personalizado, cuando sea necesario \(texto)")
        self.texto = texto
      
    }
}

/* 1
 El Scroll está justo a lado del Texto
 */
struct CodeRunsLazily: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                ForEach (100..<200) {
                    Text("Fila \($0)")
                        .font(.subheadline)
                }
            }
        }
    }
}

/* 2
 El Scroll abarca toda la pantalla
 */
struct ScrollEnTodaLaPantalla: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(1000..<1100) {
                    Text("Más filas \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}


/* 3
 No ejecuta el print hasta la fila que aparece en pantalla + 1
 */
struct ScrollViewConListas: View {
    var body: some View {
        List {
            ForEach(50..<150) {
                TextoPersonalizado("Mi texto \($0)")
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct CodeRunsLazily_Previews: PreviewProvider {
    static var previews: some View {
        //         CodeRunsLazily()
        //       ScrollEnTodaLaPantalla()
        ScrollViewConListas()
    }
}
