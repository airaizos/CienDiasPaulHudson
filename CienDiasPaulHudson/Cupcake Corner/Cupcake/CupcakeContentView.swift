//
//  CupcakeContentView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

struct CupcakeContentView: View {
    
    @ObservedObject var order = Order()
    //That’s the only place the order will be created – every other screen in our app will be passed that property so they all work with the same data.
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Selecciona el sabor", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Cuántos cupcakes:  \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnable.animation()) {
                        Text("Quieres añadir...")
                    }
                    if order.specialRequestEnable{
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Añade extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Añade extra Sprinkles")
                            
                            //to make sure that both extraFrosting and addSprinkles are reset to false when specialRequestEnabled is set to false.
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Detalle de entrega")
                    }
                }
            }
        }
        .navigationBarTitle("La esquina de los cupcakes")
    }
}

struct CupcakeContentView_Previews: PreviewProvider {
    static var previews: some View {
        CupcakeContentView()
    }
}
