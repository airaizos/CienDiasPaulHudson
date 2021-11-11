//
//  CustomShapes.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 25/10/21.
//

import SwiftUI

struct CustomShapes: View {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
                  
            path.move(to: CGPoint(x: rect.midX, y:rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x:rect.midX, y: rect.minY))
                  
        return path
                  }
    }
    
    struct Arc: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 , startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
            return path
        }
        
        }
    struct ArcAdjustment: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            
            
            let rotationAngleAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAngleAdjustment
            let modifiedEnd = endAngle - rotationAngleAdjustment
           
            var path = Path()
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
          
            return path
        }
    }
    
    var body: some View {
        VStack{
            Triangle()
                .fill(Color.orange)
                .frame(width: 200, height: 200)
            Triangle()
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 5, lineCap: .butt, lineJoin: .miter))
                .frame(width: 100, height: 100)
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(Color.gray, lineWidth: 10)
                .frame(width: 300, height: 400)
            
            //Ajustment
            ArcAdjustment(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(Color.pink, lineWidth: 5)
                .frame(width: 50, height: 50)
        }
    }
}

struct CustomShapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes()
    }
}
