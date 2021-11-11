//
//  Gradients.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        VStack {
        LinearGradient(gradient: Gradient(colors: [Color(red: 0.537, green: 0.820, blue: 0.863, opacity: 1.000), Color(red: 0.765, green: 0.525, blue: 0.945, opacity: 1.000),  Color(red: 0.973, green: 0.612, blue: 0.980, opacity: 1.000)]), startPoint: .leading, endPoint: .trailing)
            .frame(width: .infinity, height: 200, alignment:   .center)
        
            RadialGradient(gradient: Gradient(colors: [Color(red: 0.973, green: 0.804, blue: 0.510, opacity: 1.000),Color(red: 0.965, green: 0.357, blue: 0.455, opacity: 1.000),Color(red: 0.969, green: 0.125, blue: 0.471, opacity: 1.000), Color(red: 0.137, green: 0.690, blue: 0.741, opacity: 1.000),]), center: .bottom, startRadius: 50, endRadius: 500)
               .frame(width: .infinity, height: 200, alignment: .center)
            AngularGradient(gradient: Gradient(colors: [
                    Color(red: 0.451, green: 0.020, blue: 0.090, opacity: 1.000),
                    Color(red: 0.957, green: 0.271, blue: 0.376, opacity: 1.000),
                    Color(red: 0.267, green: 0.820, blue: 0.875, opacity: 1.000),
                    Color(red: 0.196, green: 0.643, blue: 0.655, opacity: 1.000),
                    Color(red: 0.118, green: 0.439, blue: 0.412, opacity: 1.000)
            ]), center: .center)
                .frame(width: .infinity, height: 200, alignment: .bottom)
                
        }
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}
