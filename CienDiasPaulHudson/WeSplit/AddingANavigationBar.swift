//
//  AddingANavigationBar.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 10/9/21.
//

import SwiftUI

struct AddingANavigationBar: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}
struct AddingANavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        AddingANavigationBar()
    }
}
