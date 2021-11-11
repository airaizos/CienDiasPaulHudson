//
//  CustomizingAnimations.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 24/9/21.
//

import SwiftUI

struct CustomizingAnimations: View {
    @State private var animacion: CGFloat = 1
    
    var body: some View {
        print(animacion)
        return VStack {
           
            Stepper("animacion", value: $animacion.animation(
            Animation.easeIn(duration: 1)
                .repeatCount(3, autoreverses: true)), in: 1...10)
            Spacer()
            
            Button("Tap me") {
                animacion += 1
            }
            .padding(40)
            .background(Color(red: 0.451, green: 0.020, blue: 0.090, opacity: 1.000))
            .foregroundColor(.gray)
            .clipShape(Circle())
            .scaleEffect(animacion)
        }
    }
}

struct CustomizingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimations()
    }
}
