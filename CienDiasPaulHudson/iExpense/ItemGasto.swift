//
//  ItemGasto.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import Foundation


struct ItemGasto: Identifiable, Codable {
    var id = UUID()
    let nombre: String
    let tipo: String
    let importe: Double
}

class Gastos: ObservableObject {
    @Published var items = [ItemGasto]() {
        
        
        //MARK: we need to create an instance of JSONEncoder that will do the work of converting our data to JSON, we ask that to try encoding our items array, and then we can write that to UserDefaults using the key “Items”.
        didSet {
            let codificador = JSONEncoder()
            
            if let codificado = try? codificador.encode(items) {
                UserDefaults.standard.set(codificado, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items")
        {
            let decodificador = JSONDecoder()
            
            if let decodificado = try? decodificador.decode([ItemGasto].self, from: items) { self.items = decodificado
                return
            }
        }
        self.items = []
    }
    
}
