//
//  AnimationAndDragGestures.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 28/9/21.
// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

import SwiftUI

let colorA1 = Color(red: 0.310, green: 0.416, blue: 0.561, opacity: 1.000)
let colorA2 = Color(red: 0.533, green: 0.635, blue: 0.737, opacity: 1.000)
let colorA3 = Color(red: 0.941, green: 0.859, blue: 0.690, opacity: 1.000)
let colorA4 = Color(red: 0.941, green: 0.859, blue: 0.690, opacity: 1.000)
let colorA5 = Color(red: 0.851, green: 0.580, blue: 0.467, opacity: 1.000)

//MARK: 4 Building custom transition using ViewModifier: https://www.hackingwithswift.com/books/ios-swiftui/building-custom-transitions-using-viewmodifier

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}


struct AnimationAndDragGestures: View {
    //MARK: 1  Drag Gestures
    @State private var cantidadArrastre = CGSize.zero
    
    
    //MARK: 2
    
    
    
    let letras = Array("Adrián Playgrunds")
    @State private var apagador = false
    @State private var arrastre = CGSize.zero
    
    //MARK: 3 Showing and hiding views with transitions
    @State private var desaparezco = false
    @State private var aparezco = false
    
    var body: some View {
        VStack {
            // MARK: 1 Drag Gestures
            LinearGradient(gradient: Gradient(colors: [colorA1,colorA3,colorA5]), startPoint: .center, endPoint: .bottomTrailing)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .offset(cantidadArrastre)
                .gesture(
                    DragGesture()
                        .onChanged { cantidadArrastre = $0.translation
                            print(cantidadArrastre)
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                cantidadArrastre = .zero }
                        }
                )
            
            HStack(spacing: 0) {
                ForEach(0 ..< letras.count) {
                    num in
                    Text(String(letras[num]))
                        .padding(10)
                        .font(apagador ? .subheadline : .title)
                        .foregroundColor(color1)
                        .background(apagador ? colorA1 : colorA5)
                        .clipShape(Circle())
                        .frame(width: apagador ? 20 : 30, height: apagador ? 2: 35)
                        .offset(arrastre)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { arrastre = $0.translation }
                    .onEnded { _ in
                        arrastre = .zero
                        apagador.toggle()
                    }
            )
            //MARK: 3 Showing and hiding views with transitions https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions
            
            Button("Aqui") {
                withAnimation {
                    desaparezco.toggle()
                }
            }
            if desaparezco {
                Rectangle()
                    .fill(colorA3)
                    .frame(width: 100, height: 100)
                    .transition(.pivot)
            }
            
            Button("yo también") {
                withAnimation {
                aparezco.toggle()
                }
            }
            if aparezco {
            Rectangle()
            .fill(colorA1)
                .frame(width: 100, height: 150)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
        }
    }
    
}

struct AnimationAndDragGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimationAndDragGestures()
    }
}
