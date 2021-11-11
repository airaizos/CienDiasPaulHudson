//
//  rectanguloBandera.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 19/9/21.
//

import SwiftUI

struct rectanguloBandera: ViewModifier {
    func body(content: Content) -> some View {
        content
            
            .frame(width: 200, height: 100, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 100), lineWidth: 2))
            .shadow(color: Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 1.000), radius: 2)
    }
}


// MARK: Colores
 let color1 = Color(red: 1.000, green: 0.988, blue: 0.251, opacity: 1.000)
let color2 = Color(red: 0.980, green: 0.729, blue: 0.380, opacity: 1.000)
let color3 = Color(red: 1.000, green: 0.506, blue: 0.447, opacity: 1.000)
let color4 = Color(red: 1.000, green: 0.184, blue: 0.663, opacity: 1.000)
let color5 = Color(red: 0.227, green: 0.341, blue: 0.604, opacity: 1.000)
let color6 = Color(red: 0.212, green: 0.141, blue: 0.310, opacity: 1.000)
