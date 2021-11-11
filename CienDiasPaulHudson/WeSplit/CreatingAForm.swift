//
//  SwiftUIView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 10/9/21.
//

import SwiftUI

struct CreatingAForm: View {
    var body: some View {
        Form {
            Group {
                ForEach(0..<5) {
                    Text("Hola \($0)")
                }
            }
            
            Section {
                Group {
                    ForEach(0..<5) {
                        Text("Adios \($0)")
                    }
                }
            }
        }
    }
}

struct CreatingAForm_Preview: PreviewProvider {
    static var previews: some View {
        CreatingAForm()
    }
}
