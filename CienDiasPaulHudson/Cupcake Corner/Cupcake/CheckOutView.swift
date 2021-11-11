//
//  CheckOutView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 1/11/21.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    
    //To confirm everything worked correctly we’re going to show an alert containing some details of our order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var alertTitle = ""
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text("El total es \(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Pagar") {
                        placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(alertTitle), message: Text("\(confirmationMessage)"), dismissButton: .default(Text("OK")))
        }
    }
    func placeOrder() {
        /*
         Inside placeOrder() we need to do three things:

         1. Convert our current order object into some JSON data that can be sent.
         */
        guard let encoded = try? JSONEncoder().encode(order)
            else {
            print("Error al decodificar el pedido")
                return
        }
       // 2.Prepare a URLRequest to send our encoded data as JSON.
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
       // 3. Run that request and process the response.
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                alertTitle = "Ops..."
                confirmationMessage = "No hay conexión a Internet"
                showingConfirmation  = true
                print("No se reciben datos: \(error?.localizedDescription ?? "Error desconocido")")
                return
            }
            
    //we’ll decode the data that came back, use it to set our confirmation message property, then set showingConfirmation to true so the alert appears. If the decoding fails – if the server sent back something that wasn’t an order for some reason – we’ll just print an error message.
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                alertTitle = "Gracias por tu compra"
                confirmationMessage = "Tu orden de \(decodedOrder.quantity) cupcakes de  \(Order.types[decodedOrder.type].lowercased()) está en camino!"
                showingConfirmation = true
            } else {
               
                print("Sin respuesta del servidor")
            }
            
            // if there is no internet connection – show an informative alert for the user.
            
            
        }.resume()
        
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
