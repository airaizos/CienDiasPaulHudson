//  FlowerShapeCGAffineTransform.swift
//  CienDiasPaulHudson
//  Created by Adrian Iraizos Mendoza on 26/10/21.

import SwiftUI

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    var petalQuantity:CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / CGFloat(petalQuantity)) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y:0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        return path
    }
}

struct FlowerShapeCGAffineTransform: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var relleno = 0
    @State private var petalQuantity:CGFloat = 8
    
    var body: some View {
        VStack {
            Text("Petal")
                .font(.title)
            Stepper(value: $relleno, in: 0...2) {
                Text("Rellenos ")
                    .padding()
            }
            switch relleno {
            case 0: Flower(petalOffset: petalOffset, petalWidth: petalWidth, petalQuantity: petalQuantity)
                .fill(Color.red)
            case 1:   Flower(petalOffset: petalOffset, petalWidth: petalWidth,petalQuantity: petalQuantity)
                .stroke(Color.red, lineWidth: 1)
            case 2:    Flower(petalOffset: petalOffset, petalWidth: petalWidth, petalQuantity: petalQuantity)
                .fill(Color.green, style: FillStyle(eoFill: true))
            default:    Flower(petalOffset: petalOffset, petalWidth: petalWidth, petalQuantity: petalQuantity)
                .fill(Color.green, style: FillStyle(eoFill: true))
            }
         
            Text("Petals: \(petalQuantity,specifier: "%.0f")")
            Slider(value: $petalQuantity, in: 0...32)
                .padding(.horizontal)
            
            Text("Offset: \(petalOffset, specifier: "%.0f")")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width: \(petalWidth, specifier:"%.0f")")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct FlowerShapeCGAffineTransform_Previews: PreviewProvider {
    static var previews: some View {
        FlowerShapeCGAffineTransform()
    }
}
