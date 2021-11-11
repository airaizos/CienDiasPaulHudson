//
//  UserDefaultStoring.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

struct UserDefaultStoring: View {
    @State private var cuenta = UserDefaults.standard.integer(forKey: "cuenta")
    
    var body: some View {
        Text("\(cuenta)")
        
        Button("+1") {
            cuenta += 1
            UserDefaults.standard.set(cuenta, forKey: "cuenta")
        }
        
    }
}

struct UserDefaultStoring_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultStoring()
    }
}
