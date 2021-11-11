//
//  AddingInsettableShapeArc.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 26/10/21.
//

import SwiftUI

struct AddingInsettableShapeArc: View {
    struct Arc: InsettableShape {
        /*
         To make Arc conform to InsettableShape we need to add one extra method to it: inset(by:). 1️⃣
         */
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        //1️⃣
        var insetAmount: CGFloat = 0
        
        func path( in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle:modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            return path
        }
        //1️⃣
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
    
    
    var body: some View {
        VStack {
        //Aquí la mitad está de la pantalla, la otra fuera.
        Circle()
            .stroke(Color.green, lineWidth: 30)
            //con strokeBorder entra en la pantalla
        Circle()
            .strokeBorder(Color.blue, lineWidth: 30)
            
            // Arc no está conformado con InsettableShape, que permite poner strokeBorder
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                .strokeBorder(Color.yellow, lineWidth: 40)
        }
    }
}

struct AddingInsettableShapeArc_Previews: PreviewProvider {
    static var previews: some View {
        AddingInsettableShapeArc()
    }
}
