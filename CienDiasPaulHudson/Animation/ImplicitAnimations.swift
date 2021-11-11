//
//  ImplicitAnimations.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 23/9/21.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var scaleCircle: CGFloat = 1
    @State private var scaleRectangle: CGFloat = 1
    @State private var scaleCapsule: CGFloat = 1
    @State private var bengala: CGFloat = 1
    
    var body: some View {
        VStack{
            Button("Ahora me lees..") {
                scaleCircle *= 1.25
            }
            .padding(50)
            .background(Color(red: 0.655, green: 0.925, blue: 0.949, opacity: 1.000))
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scaleCircle)
            .blur(radius: (scaleCircle - 1) * 1.5)
            .animation(
                Animation.easeInOut(duration: 2)
                    .delay(1))
            
            Button("Ahora no me ves") {
                scaleRectangle = 0.10
            }
            .padding(10)
            .background(Color(red: 0.949, green: 0.427, blue: 0.314, opacity: 1.000))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .scaleEffect(scaleRectangle)
            .animation(.easeInOut(duration: 2))
     
        Button("Vuelta al inicio") {
            scaleRectangle = 1
            scaleCircle = 1
            scaleCapsule = 0.5
        }
        .padding(50)
        .background(Color(red: 0.243, green: 0.612, blue: 0.749, opacity: 1.000))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .scaleEffect(scaleCapsule)
        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
            Button("repeatCount") {
                scaleCircle *= 2
            }
            .padding(20)
            .background(Color(red: 0.949, green: 0.769, blue: 0.239, opacity: 1.000))
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scaleCircle)
            .animation(
                Animation.easeInOut(duration:1)
                    .repeatCount(9, autoreverses: true))
            Button("reapeat Forever") {
                scaleRectangle *= 1.5
            }
            .padding(10)
            .background(Color(red: 0.949, green: 0.427, blue: 0.314, opacity: 1.000))
            .foregroundColor(.white)
            .scaleEffect(scaleRectangle)
            .animation(.easeIn(duration:6)
                        .repeatForever(autoreverses:true))
            
            Button("estoy aqui") {
                
            }
            .padding(30)
            .background(Color(red: 0.243, green: 0.612, blue: 0.749, opacity: 1.000))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color(red: 0.243, green: 0.612, blue: 0.749, opacity: 1.000))
                    .scaleEffect(bengala)
                    .opacity(Double( 2 - bengala))
                    .animation(
                        Animation.easeOut(duration:2)
                            .repeatForever(autoreverses: false))
            )
            //fin
            .onAppear{
                bengala = 2
            }
        }
    }
}


struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
