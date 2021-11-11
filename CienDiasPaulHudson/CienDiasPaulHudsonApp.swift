//
//  CienDiasPaulHudsonApp.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 10/9/21.
//

import SwiftUI

@main
struct CienDiasPaulHudsonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            PaginaPrincipal()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //     AdivinaLaBanderaView(bandera: Banderas())
            
            //   ContentView()
            //       .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct PaginaPrincipal: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Project 6")) {
                    
                    NavigationLink( destination: StateWithStructs(),label: { Text("StateWithStructs") })
                    NavigationLink( destination: UserDefaultStoring(), label: {  Text("UserDefaultStoring") })
                    NavigationLink(
                        destination: iExpenseView(), label: { Text("iExpense") })
                }
                Section(header: Text("Project Moonshot")) {
                    NavigationLink(
                        destination: ResizingImagesGeometryReader(), label: { Text("ResizingImagesGeometryReader") })
                    NavigationLink(
                        destination: ScrollViewConListas(),
                        label: { Text("CodeRunsLazily") })
                    NavigationLink (
                        destination: HierarchicalCodableData(),
                        label: {
                            Text("HierarchicalCodableData") })
                    
                    NavigationLink (
                        destination: Listadoview(),
                        label: {
                            Text("MoonShot") })
                    
                    NavigationLink (
                        destination: CupcakeContentView(),
                        label: {
                            Text("Cupcake") })
                    NavigationLink (destination: SizeClasseswithAnyView(),
                        label: {
                        Text("SizeClasseswithAnyView") })
                }
                Section {
                    NavigationLink (destination: BookwormView(),
                            label: {
                            Text("BookWorm") })
                    NavigationLink (destination:  CurrentView(),
                                    label: {
                                            Text("currentView")
                    })
                    
                }
            }
        }
    }
}
