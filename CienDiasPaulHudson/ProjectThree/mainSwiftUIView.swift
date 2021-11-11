//
//  mainSwiftUIView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 19/9/21.
//

import SwiftUI

struct mainSwiftUIView: View {
    var body: some View {
        VStack{
            Text("Hola")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.953, green: 0.412, blue: 0.263, opacity: 1.000))
                .edgesIgnoringSafeArea(.all)
            
            Button("Hola mundo") {
                print(type(of:self.body))
            }
            
            .frame(width: 200, height: 200)
            .background(Color(red: 0.180, green: 0.584, blue: 0.600, opacity: 1.000))
            .padding(-8)
            
            Text("insideOut")
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 0.969, green: 0.863, blue: 0.400, opacity: 1.000))
                .padding()
                .background(Color(red: 0.659, green: 0.129, blue: 0.420, opacity: 1.000))
                .padding()
                .background(Color(red: 0.945, green: 0.094, blue: 0.298, opacity: 1.000))
                .padding()
                .background(Color(red: 0.180, green: 0.584, blue: 0.600, opacity: 1.000))
                .padding()
                .background(Color(red: 0.953, green: 0.412, blue: 0.263, opacity: 1.000))
        }
    }
}

struct mainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        mainSwiftUIView()
    }
}
