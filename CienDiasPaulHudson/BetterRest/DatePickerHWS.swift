//
//  DatePickerHWS.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 20/9/21.
//

import SwiftUI

struct DatePickerHWS: View {
    @State private var wakeUp = Date()
    
    
    //MARK: 6 Intervalos
    @State private var rangoFin = Date()
    @State private var rangoInicio = Date()
    

    
    var body: some View {
        
        VStack{
            
            Text("\(wakeUp)")
            
            Text("\(rangoInicio)")
            Text("\(rangoFin)")
            
            Section(header: Text("Normal")) {
                DatePicker("Introduce la fecha", selection: $wakeUp)
            }
            Form{
                Text("Dentro de un Form")
                DatePicker("Introduce una fecha",selection: $wakeUp)
            }
            
            Section(header: Text("Ocultando el label")) {
                DatePicker("Fecha:", selection: $wakeUp)
                    .labelsHidden()
            }
            Section(header: Text("Elegir horas")){
                DatePicker("Hora",selection: $wakeUp, displayedComponents: .hourAndMinute)
            }
            Section(header: Text("Elegir dia")) {
                DatePicker("Dia",selection: $wakeUp, displayedComponents: .date)
            }
            Section(header: Text("elegir uno de los rangos")) {
                DatePicker("Fecha fin", selection: $rangoFin, in: Date()...)
                DatePicker("Fecha Inicio", selection: $rangoInicio, in: rangoInicio...)
            }

        }.padding()
    }
}
struct DatePickerHWS_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerHWS()
    }
}
