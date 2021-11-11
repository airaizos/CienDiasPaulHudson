//
//  ListOfWords.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 22/9/21.
//

import SwiftUI

struct ListOfWords: View {
    @State private var palabrasUsadas = [String]()
    @State private var palabraBase = ""
    @State private var palabraNueva = ""
    
    //Alertas
    @State private var errorTitulo = ""
    @State private var errorMensaje = ""
    @State private var mostrarError = false
    
    //Puntaje
    @State private var puntos = 0
    @State private var racha = 0
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Introduce tu palabra", text: $palabraNueva, onCommit: añadePalabra)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                List(palabrasUsadas, id:\.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                HStack {
                    Text("Puntos: \(puntos)")
                    Text("Racha: \(racha)")
                }.padding(5)
            }
            .navigationBarTitle(palabraBase)
            .navigationBarItems(trailing: Button(action: iniciarJuego){
                Text("Nueva Palabra")
                
            })
            .onAppear(perform: {iniciarJuego()})
            .alert(isPresented: $mostrarError) {
                Alert(title: Text(errorTitulo), message: Text(errorMensaje), dismissButton: .default(Text("Entendido")))
            }
            
        }
        
    }
    func añadePalabra() {
        
        let respuesta = palabraNueva.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard respuesta.count > 0 else {
            return
        }
      
        //Validaciones
        
        guard yaUsada(palabra: respuesta) else {
            errorPalabra(titulo: "Palabra ya usada", mensaje: "Piensa un poco más")
            racha = 0
            return
        }
        
        guard esPosible(palabra: respuesta) else {
            errorPalabra(titulo: "Has usado más letras", mensaje: "Mira bien las letras")
            racha = 0
            return
        }
        
        guard valida(palabra: respuesta) else {
            errorPalabra(titulo: "Esa palabra no existe", mensaje: "No inventes")
            racha = 0
            return
        }
        
        guard esMenorDeTresLetras(palabra: respuesta) else {
            errorPalabra(titulo: "Menos de 3 letras?", mensaje: "Puedes hacerlo mejor")
            racha = 0
            return
        }
        
        palabrasUsadas.insert(respuesta, at: 0)
        palabraNueva = ""
        
        //Puntaje
        
        puntos += respuesta.count
        racha += respuesta.count
        
    }
    
    func iniciarJuego() {
        if let listadoPalabrasURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let listadoPalabras = try? String(contentsOf: listadoPalabrasURL) {
                let todasLasPalabras = listadoPalabras.components(separatedBy: "\n")
                palabraBase = todasLasPalabras.randomElement() ?? "murciélago"
                
                puntos = 0
                racha = 0
                return
            }
        }
        fatalError("No se ha podido cargar el archivo start.txt")
    }
    
    // Validación palabras
    
    func yaUsada(palabra: String) -> Bool {
        !palabrasUsadas.contains(palabra)
    }
    
    func esPosible(palabra: String) -> Bool {
        var temporal = palabraBase.lowercased()
        
        for letra in palabra {
            if let pos = temporal.firstIndex(of: letra) {
                temporal.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func errorPalabra(titulo: String, mensaje: String) {
        errorTitulo = titulo
        errorMensaje = mensaje
        mostrarError = true
    }
}

func valida(palabra: String) -> Bool {
    let checker = UITextChecker()
    let rango = NSRange(location: 0, length: palabra.utf16.count)
    let rangoMalEscrito = checker.rangeOfMisspelledWord(in: palabra, range: rango, startingAt: 0, wrap: false, language: "es")
    
    return rangoMalEscrito.location == NSNotFound
}

func esMenorDeTresLetras(palabra: String) -> Bool {
    if palabra.count < 3 {
        return false
    }
    return true
}

struct ListOfWords_Previews: PreviewProvider {
    static var previews: some View {
        ListOfWords()
    }
}
