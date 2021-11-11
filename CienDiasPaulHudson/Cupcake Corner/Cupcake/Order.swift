//
//  Order.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vainilla", "Caramelo", "Chocolate", "Fresa", "Mango"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnable = false {
        //resetea el extraFrosting y addSprinkles
        didSet {
            if specialRequestEnable == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.count < 3 || streetAddress.count < 5 || city.count < 3 || Int(zip) ?? 0 < 10_000 || name.contains("   ") || streetAddress.contains("   ") || city.contains("   ") {
            return false
        }
        return true
    }
    
    var cost: Double {
        // There’s a base cost of $2 per cupcake.
        var cost = Double(quantity) * 2
        //  We’ll add a little to the cost for more complicated cakes.
        cost += (Double(type) / 2)
        
        //Extra frosting will cost $1 per cake.
        if extraFrosting {
            cost += Double(quantity)
        }
        // Adding sprinkles will be another 50 cents per cake.
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    /*
     The problem now is that we just created a custom initializer for our Order class, init(from:), and Swift wants us to use it everywhere – even in places where we just want to create a new empty order because the app just started.
     Así que creamos un init Vacío, porque Swift permite crear diferentes inits
     */
    init() { }
    
    /*
     Our final step is to implement a required initializer to decode an instance of Order from some archived data. This is pretty much the reverse of encoding, and even benefits from the same throws functionality
     */
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)

}
    /*
     The second step requires us to write an encode(to:) method that creates a container using the coding keys enum we just created, then writes out all the properties attached to their respective key. This is just a matter of calling encode(_:forKey:) repeatedly, each time passing in a different property and coding key.
     */
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
        
    
   
    
     
}


/*
3. For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.
 */
