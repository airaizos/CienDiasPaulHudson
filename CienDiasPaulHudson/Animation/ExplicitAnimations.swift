//
//  ExplicitAnimations.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 24/9/21.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animacionNumeroX = 0.0
    @State private var animacionNumeroY = 0.0
    @State private var animacionNumeroZ = 0.0
    @State private var animacionNumero1 = 0.0
    @State private var animacionNumero2 = 0.0
    @State private var animacionNumero3 = 0.0
    @State private var animacionNumero4 = 0.0
    
    @State private var randomNumero1 = 1
    @State private var randomNumero2 = 1
    @State private var randomNumero3 = 30
    @State private var padd = 30
    
    var body: some View {
        VStack{
            Button("X") {
                withAnimation{
                    animacionNumeroX += 360
                }
            }
            .padding(30)
            .background(Color(red: 0.118, green: 0.439, blue: 0.412, opacity: 1.000))
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(
                .degrees(animacionNumeroX),
                axis: (x:0, y:1, z: 0)
            )
            Button("Y"){
                withAnimation {
                    animacionNumeroY += 360
                }
            }
            .padding(30)
            .background(Color(red: 0.267, green: 0.820, blue: 0.875, opacity: 1.000))
            .foregroundColor(.white)
            .rotation3DEffect(.degrees(animacionNumeroY), axis:(x:1, y:0, z:0)
            )
            .clipShape(Capsule())
            
            Button("Z") {
                withAnimation
                {
                    animacionNumeroZ += 360
                }
            }
            .padding(30)
            .background(Color(red: 0.196, green: 0.643, blue: 0.655, opacity: 1.000))
            .foregroundColor(.white)
            .rotation3DEffect(.degrees(animacionNumeroZ),
                              axis: (x:0, y:0, z:1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button("??") {
                withAnimation {
                    animacionNumero1 += 360
                    randomNumero1 += 1
                    randomNumero2 += 1
                }
            }
            .padding(30)
            .background(Color(red: 0.957, green: 0.271, blue: 0.376, opacity: 1.000))
            .foregroundColor(.white)
            .rotation3DEffect(
                .degrees(animacionNumero1),
                axis: (x: 1, y:1, z: 1),
                anchor: .bottom,
                anchorZ: 20,
                perspective: 1
            )
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Button("???") {
                
                //animación explicita.Sin ella no habría animación
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animacionNumeroZ += 720

                }
            }
            .padding(30)
            .background(Color(red: 0.451, green: 0.020, blue: 0.090, opacity: 1.000))
            .foregroundColor(.white)
            .rotation3DEffect(.degrees(animacionNumeroZ),
                              axis: (x:1, y:1, z:0),
                              anchor: .top,
                              anchorZ: 1)
            
            
            
            //fin
        }
    }
}
struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
