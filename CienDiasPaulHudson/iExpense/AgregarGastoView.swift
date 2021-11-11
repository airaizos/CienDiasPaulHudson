//
//  AgregarGastoView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

struct AgregarGastoView: View {
    //a reference to the view’s presentation mode, then calling dismiss() on it when the time is right
    @Environment(\.presentationMode) var modoPresentacion
    
    @ObservedObject var gastos: Gastos
    
    @State private var nombre = ""
    @State private var tipo = "Personal"
    @State private var importe = ""
    
    static let tipos = ["Casa","Personal"]
   
    //  Alertas
    
    @State private var errorTitulo = ""
    @State private var errorMensaje = ""
    @State private var mostrarError = false
    

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Gasto",text: $nombre)
                
                Picker("Tipo", selection: $tipo) {
                    ForEach(AgregarGastoView.tipos, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Importe", text: $importe)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Añadir Gasto")
            
            //guarda el impote en el array de gastos (Propiedad de la otra view)
            .navigationBarItems(trailing:
                                    Button("Guardar") {
                                        if let importeReal = Double(importe) {
                                            let item = ItemGasto(nombre: nombre, tipo: tipo, importe: importeReal)
                                            gastos.items.append(item)
                                            modoPresentacion.wrappedValue.dismiss()
                                        }
                                    })
        }
        .alert(isPresented: $mostrarError) {
            Alert(title: Text(errorTitulo), message: Text(errorMensaje), dismissButton: .default(Text("Entendido")))
        }
    }
    func validarImporte(importe: String) {
        
//        if let importeReal = Double(importe) {
//            let 
//        return
//            errorTitulo = "Error"
//            errorMensaje = "Introduce un importe"
        
    }
}

struct AgregarGastoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarGastoView(gastos: Gastos())
    }
}
