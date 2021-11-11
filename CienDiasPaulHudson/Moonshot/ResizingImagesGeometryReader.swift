//
//  ResizingImagesGeometryReader.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/10/21.
//

import SwiftUI

struct ResizingImagesGeometryReader: View {
    var body: some View {
        ScrollView {
            VStack {
                
                // 1
                Text("1")
                Image("Kazajistán")
                
                //2
                Text("2")
                Image("Kazajistán")
                    .frame(width: 200, height: 100)
                
                //3
                Text("3")
                Image("Kazajistán")
                    .frame(width: 200, height: 100)
                    .clipped()
                
            }
            //Resizable + aspectRadio
            VStack {
                //4
                Text("4")
                Image("Kazajistán")
                    .resizable()
                    .frame(width: 200, height: 100)
                
                //5
                Text("5")
                Image("Kazajistán")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 100)
                
                //6
                Text("6")
                Image("Kazajistán")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 100)
            }
            //GeometryReader
            VStack{
                //7
                Text("7")
                GeometryReader { geo in
                    Image("Kazajistán")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 50)
                }
                //8
                Text("8")
                GeometryReader { geo in
                    Image("Kazajistán")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width)
                }
            }
        }
    }
}



struct ResizingImagesGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImagesGeometryReader()
    }
}
