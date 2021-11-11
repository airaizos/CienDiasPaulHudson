//
//  StacksToArrangeViews.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/9/21.
//

import SwiftUI

struct StacksToArrangeViews: View {
    var body: some View {
        VStack(spacing: 30) {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello, World 1")

            }
            VStack(alignment: .trailing, spacing: 10) {
                Text("Hello,  World 2")
            }
            VStack {
                Text("Hello, World 3 ")
            }
            HStack(alignment: .bottom) {
                Text("Salut, Monde")
                Text("Salut, \n Monde")
                Text("Salut, \n \n Monde")
            }
            HStack(alignment: .center) {
                Text("Salut, Monde")
                Text("Salut, \n Monde")
                Text("Salut, \n \n Monde")
            }
            HStack(alignment: .top, spacing: 4) {
                Text("Salut, Monde")
                Text("Salut, \n Monde")
                Text("Salut, \n \n Monde")
            }
        }
    }
}

struct StacksToArrangeViews_Previews: PreviewProvider {
    static var previews: some View {
        StacksToArrangeViews()
    }
}
