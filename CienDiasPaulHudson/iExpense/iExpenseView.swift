//
//  iExpenseView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from

import SwiftUI

struct iExpenseView: View {
    @ObservedObject var gastos = Gastos()
    
    @State private var mostrarAgregarGasto = false
    @State private var total = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gastos.items) {
                    item in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(item.nombre)
                                .font(.headline.italic())
                            Text(item.tipo)
                                .font(.footnote)
                                .foregroundColor(item.tipo == "Personal" ? .green : .gray)
                        }
                        Spacer()
                        Text("\(item.importe,specifier: "%.02f")€")
                            .foregroundColor(item.importe < 11 ? .blue : item.importe < 101 ? .orange : .red)
                    }
                }
                .onDelete(perform: quitarItems)
            }
            
                
                .navigationBarTitle("iExpense")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            //                                         let gasto = ItemGasto(nombre: "Test", tipo: "Casa", importe: 5)
                                            //                                        gastos.items.append(gasto)
                                            mostrarAgregarGasto = true
                                        }) {
                                            Image(systemName: "plus")
                                        })
        }
        .sheet(isPresented: $mostrarAgregarGasto) {
            AgregarGastoView(gastos: gastos)
        }

    }

    func quitarItems(at offsets: IndexSet) {
        gastos.items.remove(atOffsets: offsets)
        
    }
    
    
    
}

struct iExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseView()
    }
}
