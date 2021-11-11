//
//  BordersAndFillsImagePaint.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 26/10/21.
//

import SwiftUI

struct BordersAndFillsImagePaint: View {
    var body: some View {
        ScrollView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 200)
                    .background(Color.red)
                
                Text("Hola")
                    .frame(width:200, height: 200)
                    .border(Color.yellow, width:30)
                
                Text("Salut")
                    .frame(width: 150, height: 150)
                    .background(Image("Armenia"))
                
                Text("Hello")
                    .frame(width: 300, height: 150)
                    .border(ImagePaint(image: Image("China"), scale: 0.2), width: 30)
                
                Text("Hi")
                    .frame(width: 200, height: 100)
                    .border(ImagePaint(image: Image("Belice"), sourceRect: CGRect(x:0, y:0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
                
                Capsule()
                    .strokeBorder(ImagePaint(image: Image("Barhein"),scale: 0.1), lineWidth: 20)
                    .frame(width: 200, height: 100)
            }
        }
    }
}

struct BordersAndFillsImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        BordersAndFillsImagePaint()
    }
}
