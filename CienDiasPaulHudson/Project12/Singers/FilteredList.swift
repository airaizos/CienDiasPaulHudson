//
//  FilteredList.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/11/21.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    //1
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue }
    
    let content: (T) -> Content
    
    
    var body: some View {
        List(fetchRequest.wrappedValue, id:\.self) { singer in
            self.content(singer)
        }
    }
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content }
}


/*
import SwiftUI

struct FilteredList: View {
    //1
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id:\.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
*/
