//
//  CustomComponentBinding.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 3/11/21.
//

import SwiftUI

struct PushButton: View {
    let title: String
    //@State var isOn: Bool no aactualiza a todos
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white:0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct CustomComponentBinding: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Recuerdame", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
            
        Toggle(isOn: $rememberMe) {
            Text("Recuérdame")
        }
        
        
        }
    }
}

struct CustomComponentBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentBinding()
    }
}
