//
//  ConditionalModifiers.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 19/9/21.
//

import SwiftUI


let granate:    Color = Color(red: 0.659, green: 0.129, blue: 0.420, opacity: 1.000)
let rojizo:     Color = Color(red: 0.945, green: 0.094, blue: 0.298, opacity: 1.000)
let naranja:    Color = Color(red: 0.953, green: 0.412, blue: 0.263, opacity: 1.000)
let amarillo:   Color = Color(red: 0.969, green: 0.863, blue: 0.400, opacity: 1.000)
let verde:      Color = Color(red: 0.180, green: 0.584, blue: 0.600, opacity: 1.000)


//MARK: 4 Custom modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(granate)
            .padding()
            .background(verde)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}


struct Watermark: ViewModifier {
    var text: String
    
    func body(content:Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(naranja)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ConditionalModifiers: View {
    //MARK: 1
    @State private var estáOcupado = true
    
    
    //MARK: 2 View as a properties
    @State private var numero = ""
    let texto1 = Text("primer texto")
    let texto2 = Text("segundo texto")
    var campoTexto: some View { TextField("Escribe numero", text: $numero) }
    
    //MARK: 3 View composition
    
    struct RoundedRectangleText: View {
        var text: String
        
        var body: some View {
            VStack{
                Text(text)
                    
                    .font(.largeTitle)
                    .padding()
                    .background(granate)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
            }
        }
    }
    
    
    
    
    var body: some View {
        VStack {
            // 1
            Button("Ocupado") {
                withAnimation{
                    estáOcupado.toggle()
                }
            }
            .foregroundColor(.white)
            .background(estáOcupado ? rojizo : .white)
            
            Section {
                Text("Alfa")
                    .blur(radius: 0)
                    .font(.largeTitle)
                Text("Beta")
                Text("Gama")
            }
            .blur(radius: 3)
            .font(.caption)
            // 2
            Section {
                texto1
                texto2
                campoTexto
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            // 3
            Section{
                RoundedRectangleText(text: "Ejemplo 1")
                    .foregroundColor(.white)
                RoundedRectangleText(text: "Numero 2")
                    .foregroundColor(naranja)
            }
            
            // 4
            Section {
               
                Text("modifier Title")
                    .modifier(Title())
                
                Text("extension modifier")
                    .titleStyle()
                
                
                amarillo
                    .frame(width: .infinity, height: 100)
                    .watermarked(with: "Adrian Playgrounds")
                
                
                
            }
            
        }
        
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}



