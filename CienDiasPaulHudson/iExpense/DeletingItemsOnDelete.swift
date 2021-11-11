//
//  DeletingItemsOnDelete.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

struct DeletingItemsOnDelete: View {
    @State private var numeros = [1]
    
    @State private var numeroActual = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numeros, id:\.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: quitarFilas)
                }
                Button("(FOREACH)añadir row") {
                    numeros.append(numeroActual)
                    numeroActual += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func quitarFilas(at offsets: IndexSet) {
        numeros.remove(atOffsets: offsets)
    }
}


struct DeletingItemsOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItemsOnDelete()
    }
}
