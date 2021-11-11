//
//  ButtonsAndImages.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct ButtonsAndImages: View {
    var body: some View {
        Button(action: {
            print("Tap en el botón")
        }) {
            HStack(spacing: 10) {
            Image(systemName: "pencil")
                .renderingMode(.original)
            Text("Editar")
            }.font(.largeTitle)
        }
    }
}

struct ButtonsAndImages_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsAndImages()
    }
}
