//
//  StackingButtons.swift
//  CienDiasPaulHudson
//https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-wrap-up
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct StackingButtons: View {

    
    @State private var paises = ["Estonia","Francia","Alemania","Irlanda","Italia","Nigeria","Polonia","Rusia","España","Reino Unido","EEUU","Sudáfrica","Lesotho","Zambia","Botswana","Angola","Malaui","Namibia","Republica Centroafricana","Antigua y Barbuda","Bahamas","Barbados","Belice","Colombia","Costa Rica","Cuba","Dominica","Granada","Guatemala","Guyana","Haiti","Honduras","Trinidad y Tobago","Surinam","San Vicente y las Granadinas","San Cristobal y Nieves","Republica Dominicana","Panama","Mauritania","Eritrea","Uganda","Togo","Republica Democrática del Congo","Tanzania","Sudan","Senegal","Senegal","Ruanda","Mali","Kenia","Guinea","Burundi","Burkina Faso","Argelia","Etiopia"]
        .shuffled()
    
    @State private var mostrarPuntuacion = false
    @State private var respuestaCorrecta = Int.random(in: 0...3)
    @State private var tituloPuntuacion = ""
    @State private var puntuación = 0
    @State private var racha = 0
    @State private var enJuego = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 1.000, green: 0.184, blue: 0.663, opacity: 1.000),Color(red: 0.227, green: 0.341, blue: 0.604, opacity: 1.000),Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 1.000)]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 70) {
                
                if enJuego {
                    VStack {
                        Section {
                            Text("Pulsa la bandera de...")
                            Text(paises[respuestaCorrecta])
                            
                        }
                        .foregroundColor(Color(red: 1.000, green: 0.988, blue: 0.251, opacity: 1.000))
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        ForEach( 0 ..< 4) { numero in
                            Button(action: {
                                banderaPulsada(numero)
                            }) {
                                Image(paises[numero])
                                    .renderingMode(.original)
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 100), lineWidth: 2))
                                    .shadow(color: Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 1.000), radius: 2)
                            }
                            .padding()
                        }
                    }
                    
                    Spacer()
                } else {
                    VStack {
                        Button(action: {
                           preguntar()
                            
                        }) {
                            Image(paises[respuestaCorrecta])
                                .renderingMode(.original)
                                .frame(width: 300, height: 150, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 100), lineWidth: 2))
                                .shadow(color: Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 1.000), radius: 2)
                        }
                        Section {
                                Text("Puntos \(puntuación)")
                                Text("Racha \(racha)")
                        }
                            .foregroundColor(Color(red: 1.000, green: 0.988, blue: 0.251, opacity: 1.000))
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    
                }
                
            }
        }
    }
    func banderaPulsada(_ numero: Int) {
        if numero == respuestaCorrecta {
            tituloPuntuacion = "Correcto"
            puntuación += 1
            racha += 1
            enJuego.toggle()
            
        } else {
            tituloPuntuacion = "Incorrecto"
            racha = 0
        }
        mostrarPuntuacion = true
    }
    
    func preguntar() {
        respuestaCorrecta = Int.random(in: 0...3)
        paises.shuffle()
        enJuego.toggle()
        
    }
        
        
        
    }


struct StackingButtons_Previews: PreviewProvider {
    static var previews: some View {
        StackingButtons()
    }
}


//                    .foregroundColor(Color(red: 1.000, green: 0.988, blue: 0.251, opacity: 1.000))
//                    .font(.largeTitle)



//            .sheet(isPresented: $mostrarPuntuacion, onDismiss: preguntar, content: {
//                RespuestaView()
//            })
//
//            .alert(isPresented: $mostrarPuntuacion,  content:{
//                Alert(title: Text(tituloPuntuacion), message: Text("Tu puntaje es \(puntuación) y racha de \(racha)"), dismissButton: .default(Text("Continuar")){
//                    preguntar()
//                }))
