//
//  CustomPaths.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 25/10/21.
//

import SwiftUI

struct CustomPaths: View {
    var body: some View {
        
        /*
         Con los Paths las coordinadas son fijas!
         */
        
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y:100))
                path.addLine(to: CGPoint(x: 100, y:300))
                path.addLine(to: CGPoint(x: 300, y:300))
                path.addLine(to: CGPoint(x: 200, y:100))
                //el ángulo de arriba se ve cortado. Habría que añadir otra línea
                path.addLine(to: CGPoint(x: 100, y:300))
            }
            .stroke(Color.blue, lineWidth: 3)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y:100))
                path.addLine(to: CGPoint(x: 100, y:300))
                path.addLine(to: CGPoint(x: 300, y:300))
                path.addLine(to:CGPoint(x: 200, y:100))
            }
            Path { path in
                path.move(to: CGPoint(x: 200, y:100))
                path.addLine(to: CGPoint(x: 100, y:300))
                path.addLine(to: CGPoint(x: 300, y:300))
                path.addLine(to:CGPoint(x: 200, y:100))
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
        }
    }
}

struct CustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaths()
    }
}
