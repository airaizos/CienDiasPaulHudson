//
//  LoadingResources.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 22/9/21.
//

import SwiftUI

struct LoadingResources: View {
    var body: some View {
        guard let fileURL = Bundle.main.url(forResource: "cualqueir-archivo", withExtension: "txt") else {
    fatalError("Error al encontrar el archivo")
        
            //buscamos el archivo
        }
            guard let fileContents = try? String(contentsOf: fileURL) else {
                fatalError("Error al cargar el archivo")
                //aqui cargamos el archivo a un String
            }
        
        return Text("\(String(fileContents))")
    }
}

struct LoadingResources_Previews: PreviewProvider {
    static var previews: some View {
        LoadingResources()
    }
}
