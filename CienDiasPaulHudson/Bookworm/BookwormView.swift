//
//  BookwormView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 7/11/21.
//

import SwiftUI

struct BookwormView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id:\.id) { student in Text(student.name ?? "Desconocido")
                }
            }
            Button("Añadir") {
                let firstNames = ["Gina", "Javier","Herminia","Luna","Ronaldo"]
                let lastNames = ["Granjero", "Amos","López","Hernandez"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct BookwormView_Previews: PreviewProvider {
    static var previews: some View {
        BookwormView()
    }
}
