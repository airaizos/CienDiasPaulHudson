//
//  drawingGroupMetalRendering.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 26/10/21.
//

import SwiftUI



struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by:CGFloat(value))
                    .strokeBorder(self.color(for: value, brightness: 1),lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue:targetHue, saturation: 1, brightness: brightness)
    }
}


struct ColorCyclingCircleGradient: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness:0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue:targetHue, saturation: 1, brightness: brightness)
    }
}
struct drawingGroupMetalRendering: View {
    @State private var colorCycleOne = 0.0
    @State private var colorCycleTwo = 0.0
    var body: some View {
        VStack{
            ColorCyclingCircle(amount: colorCycleOne)
                .frame(width: 300, height:300)
            Slider(value: $colorCycleOne)
            
         
            ColorCyclingCircleGradient(amount: colorCycleTwo)
                .frame(width:400, height: 400)
            Slider(value: $colorCycleTwo)
            
           
        }
        
    }
}

struct drawingGroupMetalRendering_Previews: PreviewProvider {
    static var previews: some View {
        drawingGroupMetalRendering()
    }
}
