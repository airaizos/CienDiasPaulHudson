//
//  ConditionalSaving.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/11/21.
//

import SwiftUI

struct ConditionalSaving: View {
    @Environment(\.managedObjectContext) var moc1
    
    var body: some View {
        Button("Guardar") {
            if self.moc1.hasChanges {
                try? self.moc1.save()
            }
        }
    }
}

struct ConditionalSaving_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSaving()
    }
}
