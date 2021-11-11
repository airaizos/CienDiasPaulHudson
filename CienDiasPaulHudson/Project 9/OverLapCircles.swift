//
//  OverLapCircles.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 26/10/21.
//

import SwiftUI

struct OverLapCircles: View {
    @State private var cantidad: CGFloat = 0.0
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * cantidad)
                    .offset(x: -50, y: -80)
                    .blendMode(.exclusion)
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 200 * cantidad)
                    .offset(x: 50, y: -80)
                    .blendMode(.exclusion)
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * cantidad)
                    .blendMode(.exclusion)
            }
            .frame(width: 300, height:300)
            
            Slider(value: $cantidad)
                .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct OverLapCircles_Previews: PreviewProvider {
    static var previews: some View {
        OverLapCircles()
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
