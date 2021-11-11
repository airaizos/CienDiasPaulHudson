//
//  AddressView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Nombre", text: $order.name)
                TextField("Calle", text: $order.streetAddress)
                TextField("Ciudad", text: $order.city)
                TextField("Código Postal", text: $order.zip)
            }
            Section {
                NavigationLink(destination: CheckOutView(order: order)) {
                    Text("CheckOut")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Detalle de entrega")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
