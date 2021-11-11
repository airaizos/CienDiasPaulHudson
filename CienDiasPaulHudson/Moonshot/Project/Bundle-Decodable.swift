//
//  Bundle-Decodable.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 12/10/21.
//

import Foundation

extension Bundle {
    func decodifica<T: Codable>(_ archivo:String) -> T {
        guard let url = url(forResource: archivo, withExtension: nil) else {
            fatalError("Error al localizar el archivo \(archivo) en el bundle")
        }
        guard let datos = try? Data(contentsOf: url) else {
            fatalError("Error al cargar \(archivo) del bundle")
        }
        let decodificador = JSONDecoder()
        let formateador = DateFormatter()
        formateador.dateFormat = "y-MM-dd"
        decodificador.dateDecodingStrategy = .formatted(formateador)
        
        guard let cargado = try? decodificador.decode(T.self, from: datos) else {
            fatalError("Error al decodificar \(archivo) del bundle")
        }
        return cargado
    }
}
