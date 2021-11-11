//
//  ColorsAndFrames.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct ColorsAndFrames: View {
    var body: some View {
        ZStack{
      
            Color(red: 0.373, green: 0.897, blue: 0.056, opacity: 1.000).edgesIgnoringSafeArea(.all)
            Color(red: 0.897, green: 0.042, blue: 0.574, opacity: 1.000).frame(width: 300, height: 150)
                
            Text("Mi contenido")
                .font(.largeTitle)
        }
    }
}

struct ColorsAndFrames_Previews: PreviewProvider {
    static var previews: some View {
        ColorsAndFrames()
    }
}
