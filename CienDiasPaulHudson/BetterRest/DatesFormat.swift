//
//  DatesFormat.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 20/9/21.
//

import SwiftUI

struct DatesFormat: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("¿A que hora quieres despertarte?")
                        .font(.headline)
                    
                    DatePicker("Indica la hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("¿Cuántas horas quieres dormir?")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.50) {
                        Text("\(sleepAmount,specifier: "%g") horas")
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("¿Cuántos cafés has tomado hoy?")
                        .font(.headline)
                    //No me gusta con el piker
//                    Picker("Cafes", selection: $coffeeAmount) {
//                        ForEach(0 ..< 20) { cups in
//                            Text("\(cups)")
//                        }
//                    }
                    Stepper(value: $coffeeAmount, in: 0...20) {
                        if coffeeAmount == 1 {
                            Text("1 taza")
                        } else {
                            Text("\(coffeeAmount) tazas")
                        }
                    }
                }
                
                
                    
                
            Section {
                Text("Deberías estar dormido a las \(irseALaCama) ")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            }
            .navigationBarTitle("Better Rest")
//            .navigationBarItems(trailing:
//                                    Button(action: calcularBedTime){
//                                        Text("Calcular")
//                                    })
        }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    //Quitar el botón CALCULAR y ponerlo como string...
    
    
    var irseALaCama: String {
        
        let componentes = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
        let hour = (componentes.hour ?? 0) * 60 * 60
        let minute = (componentes.minute ?? 0) * 60
        var bedTime = "Introduce valores"
        
        do {
            let modelo: SleepCalculator = try SleepCalculator(configuration: .init())
            let prediction = try modelo.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            bedTime = formatter.string(from: sleepTime)
        } catch {
            alertTitle = "Error"
            alertMessage = "Lo siento, ha habido un error"
            showingAlert = true
            
        }
        
        return bedTime
    }
    
    func calcularBedTime() {


        let componentes = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
        let hour = (componentes.hour ?? 0) * 60 * 60
        let minute = (componentes.minute ?? 0) * 60

        do {
            let modelo: SleepCalculator = try SleepCalculator(configuration: .init())
            let prediction = try modelo.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Deberías estar dormido a las..."
            
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Lo siento, ha habido un problema"
            
        }
        
        showingAlert = true
        
        
        
    }
}

struct DatesFormat_Previews: PreviewProvider {
    static var previews: some View {
        DatesFormat()
    }
}


