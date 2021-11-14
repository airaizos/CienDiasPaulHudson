//
//  DinamicallyFiltering.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/11/21.
//

import CoreData
import SwiftUI

struct DinamicallyFiltering: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    
    var body: some View {
        VStack {
        //listado filteredList
           // FilteredList(filter: lastNameFilter)
            
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                
            }
            
            
            Button("Añadir ejemplos") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
             
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkinks"
                
                try? moc.save()
            }
            Button("Mostrar los que comienzan con A") {
                lastNameFilter = "A"
            }
            Button("Mostrar los que comienzan con S") {
                lastNameFilter = "S"
            }
            Button("Mostrar todos"){
                lastNameFilter = "*"
            }
        }
        
        
    }
}

struct DinamicallyFiltering_Previews: PreviewProvider {
    static var previews: some View {
        DinamicallyFiltering()
    }
}
