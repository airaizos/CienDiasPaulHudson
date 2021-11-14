//
//  FilteringUsingNSPredicate.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/11/21.
//
import CoreData
import SwiftUI

struct FilteringUsingNSPredicate: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity:Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name CONTAINS[c] %@", "x")) var ships: FetchedResults<Ship>
    
    /*
     Ejemplos predicate:
     NSPredicate(format: "universe == 'Star Wars'"))
     NSPredicate(format: "universe == %@", "Star Wars"))
     NSPredicate(format: "name < %@", "F"))
     NSPredicate(format: "universe IN %@", ["Aliens","Firefly","Star Trek"]))
     NSPredicate(format: "name BEGINSWITH %@", "E"))
     NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
     NSPredicate(format: "name CONTAINS[c] %@", "x"))
     NSPredicate(format: "NOT name BEGINSWITH[c] %@", "M"
     */
    
    var body: some View {
        VStack {
            List(ships, id:\.self) { ship in
                Text(ship.name ?? "Nombre desconocido")
            }
            Button("Añade ejemplos") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Start Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
            
        }
    }
}

struct FilteringUsingNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FilteringUsingNSPredicate()
    }
}
