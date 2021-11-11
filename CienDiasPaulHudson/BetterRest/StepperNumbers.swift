//
//  Stepper.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 20/9/21.
//

import SwiftUI

//MARK: 1 Stepper

struct StepperNumbers: View {
    //MARK: 1 Stepper
    @State private var sleepAmount = 8.0
    
    
    var body: some View {
        VStack{
            
            Stepper(value: $sleepAmount, in: 4...16, step: 0.5) {
                Text("\(sleepAmount,specifier: "%g") hours")

            }
            
        }
        
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperNumbers()
    }
}

