//
//  RelationshipsWithCoreData.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/11/21.
//

import SwiftUI

struct RelationshipsWithCoreData: View {
    @Environment(\.managedObjectContext)  var moc
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        List {
            ForEach(countries, id: \.self) { country in
                if #available(iOS 15.0, *) {
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        Button("Añadir") {
            let candy1 = Candy(context: moc)
            candy1.name = "Mars"
            candy1.origin = Country(context: moc)
            candy1.origin?.shortName = "UK"
            candy1.origin?.fullName = "United Kingdom"
            
            let candy2 = Candy(context: moc)
            candy2.name = "KitKat"
            candy2.origin = Country(context: moc)
            candy2.origin?.shortName = "UK"
            candy2.origin?.fullName = "United Kingdom"
            
            let candy3 = Candy(context: moc)
            candy3.name = "Twix"
            candy3.origin = Country(context: moc)
            candy3.origin?.shortName = "UK"
            candy3.origin?.fullName = "United Kingdom"
            
            let candy4 = Candy(context: moc)
            candy4.name = "Toblerone"
            candy4.origin = Country(context: moc)
            candy4.origin?.shortName = "CH"
            candy4.origin?.fullName = "Switzerland"
            
            try? moc.save()
            
        }
    }
    

}

struct RelationshipsWithCoreData_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipsWithCoreData()
    }
}
