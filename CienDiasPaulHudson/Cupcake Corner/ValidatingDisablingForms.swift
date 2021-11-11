//
//  ValidatingDisablingForms.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

struct ValidatingDisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || (!email.contains("@") ||  !email.contains("."))
        
    }
    
    var body: some View {
        Form {
            Section {
                TextField("usuario", text: $username)
                TextField("correo", text: $email)
            }
            Section {
                Button("Crear cuenta") {
                    print("Creando tu cuenta...")
                    
                }.disabled(disableForm)
            }
        }
    }
}

struct ValidatingDisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingDisablingForms()
    }
}
