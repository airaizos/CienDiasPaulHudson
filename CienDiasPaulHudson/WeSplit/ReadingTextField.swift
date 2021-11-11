//
//  ReadingTextField.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 10/9/21.

//

import SwiftUI

struct ReadingTextField: View {
    @State private var importeCuenta = ""
    @State private var totalPersonas = ""
    @State private var propinaPorcentaje = 2
    
    let porcentajesPropina = [10,15,20,25,0]
    
    var totalPorPersona: (Double,Double) {
        let comensales = Double(totalPersonas) ?? 1
        let propina = Double(porcentajesPropina[propinaPorcentaje])
        let importeTotal = Double(importeCuenta) ?? 0
        
        let propinaValor = importeTotal / 100 * propina
        let granTotal = importeTotal  + propinaValor
        let importePorPersona = granTotal / comensales
        
        return (importePorPersona, propinaValor)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Importe / Comensales")) {
                    TextField("Importe", text:$importeCuenta)
                        .keyboardType(.decimalPad)
                    TextField("Total Personas", text: $totalPersonas)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("¿Cuánta propina quieres dejar?")) {
                    Picker("Propina",selection: $propinaPorcentaje) {
                        ForEach(0 ..< porcentajesPropina.count) {
                            Text("\(porcentajesPropina[$0])%")
                            
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(totalPorPersona.1,specifier: "%.2f")€")

                        
                
            }
            
                
                Section(header: Text("Importe por persona")) {
                    Text("\(totalPorPersona.0,specifier: "%.2f")€")
                }
            }
            .navigationBarTitle("Pidamos la cuenta",displayMode: .inline)
        }
        
    }
}

struct ReadingTextField_Previews: PreviewProvider {
    static var previews: some View {
        ReadingTextField()
    }
}
