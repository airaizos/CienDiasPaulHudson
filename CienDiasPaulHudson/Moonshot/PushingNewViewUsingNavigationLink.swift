//
//  PushingNewViewUsingNavigationLink.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/10/21.
//https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink
//

import SwiftUI

struct PushingNewViewUsingNavigationLink: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Vista detalle")) {
                    Text("Hola Mundo")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
        
        NavigationView {
            List(0..<100) { fila in
                NavigationLink(destination: Text("Detalle de la Fila \(fila)")) {
                    Text("Fila \(fila)")
                }
            }
            .navigationBarTitle("Filas")
        }
    }
}

struct PushingNewViewUsingNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        PushingNewViewUsingNavigationLink()
    }
}
