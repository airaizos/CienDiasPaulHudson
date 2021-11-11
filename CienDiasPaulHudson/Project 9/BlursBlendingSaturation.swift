//
//  BlursBlendingSaturation.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 26/10/21.
//

import SwiftUI

struct BlursBlendingSaturation: View {
    @State private var amount:CGFloat = 0
    @State private var radio: CGFloat = 0
    
    var body: some View {
        ScrollView {
        VStack {
        ZStack {
            Image("Cuba")
            Rectangle()
                .fill(Color.red)
                .blendMode(.difference)
        }
        .frame(width: 400, height:500)
        .clipped()
        
            Image("Guyana")
                .colorMultiply(.blue)
            
            
            Image("España")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - radio) * 20)
            
            Text("saturation: \(amount,specifier: "%.02f")")
            Slider(value: $amount)
                .padding()
            Text("radius: \(radio, specifier: "%.02f")")
            Slider(value: $radio)
                .padding()
        }
        }
    }
}

struct BlursBlendingSaturation_Previews: PreviewProvider {
    static var previews: some View {
        BlursBlendingSaturation()
    }
}


/*
enum blendMode {
case color
case colorBurn
case colorDodge
case darken
case destinationOut
case destinationOver
case difference
case exclusion
case hardLight
case hue
case lighten
case luminosity
case multiply
case normal
case overlay
case plusDarker
case plusLighter
case saturation
case screen
case softLight
case sourceAtop
}
*/
