//
//  ListBestFriend.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 22/9/21.
//

import SwiftUI

struct ListBestFriend: View {
    let people = ["Finn", "Leia","Luke","Rey"]
    
    var body: some View {
        VStack{
        List {
            Section(header: Text("Sección Estática")) {
                Text("Fila estática 1")
                Text("Fila estática 2")
            }
            Section(header: Text("Sección Dinámica")) {
                ForEach(1..<5) {
                    Text("Fila dinamica \($0)")
                }
            }
        }
        .listStyle(GroupedListStyle())
            
            List {
                Section(header: Text("Sección Estática")) {
                    Text("Fila estática 1")
                    Text("Fila estática 2")
                }
                Section(header: Text("Sección Dinámica")) {
                    ForEach(1..<5) {
                        Text("Fila dinamica \($0)")
                    }
                }
            }
            .listStyle(PlainListStyle())
            List {
                Section(header: Text("Sección Estática")) {
                    Text("Fila estática 1")
                    Text("Fila estática 2")
                }
                Section(header: Text("Sección Dinámica")) {
                    ForEach(1..<5) {
                        Text("Fila dinamica \($0)")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            List {
                Section(header: Text("Sección Estática")) {
                    Text("Fila estática 1")
                    Text("Fila estática 2")
                }
                Section(header: Text("Sección Dinámica")) {
                    ForEach(people, id:\.self) {
                        Text($0)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ListBestFriend_Previews: PreviewProvider {
    static var previews: some View {
        ListBestFriend()
    }
}
