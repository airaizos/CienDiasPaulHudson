//
//  SizeClasseswithAnyView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 3/11/21.
//

import SwiftUI

struct SizeClasseswithAnyView: View {
//1
    @Environment (\.presentationMode) var presentationMode
  //2
    @Environment (\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        //1
  //      Text("hello")
 //          .onTapGesture {
 //               presentationMode.wrappedValue.dismiss()
 //           }
        //2
        if  sizeClass == .compact {
            return AnyView(VStack{
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.title)
            .foregroundColor(.red))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle)
            .foregroundColor(.blue))
        }
    }
}

struct SizeClasseswithAnyView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClasseswithAnyView()
    }
}
