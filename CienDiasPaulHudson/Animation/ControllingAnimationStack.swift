//
//  ControllingAnimationStack.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 28/9/21.
//

import SwiftUI

struct ControllingAnimationStack: View {
    @State private var enable = false
    
    var body: some View {
        Button("Pulsame") {
            enable.toggle()
        }
        .foregroundColor(enable ? .white : .green)
        .frame(width: 100, height: 100)
        .background(enable ? Color.orange : Color.white)
        .animation(enable ? nil : .easeIn(duration: 0.5))
        .clipShape(RoundedRectangle(cornerRadius: enable ? 100 : 0))
        .animation(.interpolatingSpring(stiffness: 4, damping: 1))
    }
}

struct ControllingAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllingAnimationStack()
    }
}
