//
//  Espirógrafo.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
// https://www.hackingwithswift.com/books/ios-swiftui/creating-a-spirograph-with-swiftui

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    // gcd = greatest common divisor
    func gcd(_ a: Int,_ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x:x, y:y))
            }
        }
        return path
    }
}

struct Espirografo: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    @State private var saturation = 1.0
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()

            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: saturation, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)
               

            Spacer()
            
            Group {
                Text("Circulo interior \(innerRadius, specifier: "%.0f")")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal,.bottom])
                Text("circulo exterior) \(outerRadius,specifier: "%.0f")")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal,.bottom])
                Text("Tamaño \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal,.bottom])
                Text("Color \(hue)")
                Slider(value: $hue)
                    .padding(.horizontal)
                Text("Saturacion \(saturation)")
                Slider(value: $saturation)
                    .padding(.horizontal)
            }
        }
    }
}

struct Espirografo_Previews: PreviewProvider {
    static var previews: some View {
        Espirografo()
    }
}
