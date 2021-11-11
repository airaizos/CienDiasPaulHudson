//
//  TrapezoidAnimated.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y:rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x:  rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct TrapezoidAnimated: View {
    
    @State private var insetAmount: CGFloat  = 50
 
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            
            .stroke(Color.purple, style: StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter))
            
            .frame(width: 200, height: 100)

          
            .onTapGesture {
                withAnimation {
                self.insetAmount = CGFloat.random(in: 1...99)
                }
            }
    }
}

struct TrapezoidAnimated_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidAnimated()
    }
}
