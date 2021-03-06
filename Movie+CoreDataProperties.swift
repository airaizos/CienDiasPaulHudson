//
//  Movie+CoreDataProperties.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 11/11/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Título desconocido"
    }
    
}

extension Movie : Identifiable {

}
