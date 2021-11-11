//
//  WorkingWithStrings.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 22/9/21.
//

import SwiftUI

struct WorkingWithStrings: View {

    
    var body: some View {
        
        VStack {
            //MARK: 1
            let input = "a b c d e f "
            let letters = input.components(separatedBy: " ")
            ForEach(letters, id:\.self) {
                Text($0)
                
            }
            .padding(1)
                //MARK: 2
               
                let input2 = """
                                a
                                b
                                c
                                d
                                e
                            
                            """
                let letters2 = input2.components(separatedBy: "\n")
                ForEach(letters2, id:\.self) {
                    Text($0)
                }
                .padding(1)
            //MARK: 3
            
            let letraAlAzar = letters2.randomElement()
            Text("\(letraAlAzar ?? "0")")
            
            
        //MARK: 4
            let input3 = "This  uses \n a new type \n called"
        let trimmed = input3.trimmingCharacters(in: .whitespacesAndNewlines)

            Text(trimmed)
            
            
            //MARK: 5
            let palabra = "espeleógrafo"
            let checker = UITextChecker()
            let rango = NSRange(location: 0,length: palabra.utf16.count)
            let palabraMalEscrita = checker.rangeOfMisspelledWord(in: palabra, range: rango, startingAt: 0, wrap: false, language: "es")
            
            let _ = palabraMalEscrita.location == NSNotFound
            
            
            
            
        }
    }
}

struct WorkingWithStrings_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithStrings()
    }
}
