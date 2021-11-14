//
//  Singer+CoreDataProperties.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 14/11/21.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    // 1: crear la entidad 2 darles valor  y que no sean nil
    var wrappedFirstName: String {
        firstName ?? "Desconocido"
    }
    var wrappedLastName: String {
        lastName ?? "Desconocido"
    }
}

extension Singer : Identifiable {

}
