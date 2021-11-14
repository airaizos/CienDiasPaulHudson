//
//  UniqueObjectsConstraints.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/11/21.
//

import SwiftUI

struct UniqueObjectsConstraints: View {
    @Environment(\.managedObjectContext) var moc2
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id:\.self) { wizard in
                Text(wizard.name ?? "Desconocido")
            }
            Button("añadir") {
                let wizard = Wizard(context: self.moc2)
                wizard.name = "Harry Potter"
            }
            Button("guardar") {
                do {
                    try self.moc2.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}

struct UniqueObjectsConstraints_Previews: PreviewProvider {
    static var previews: some View {
        UniqueObjectsConstraints()
    }
}
