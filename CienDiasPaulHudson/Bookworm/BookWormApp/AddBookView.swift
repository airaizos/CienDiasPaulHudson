//
//  AddBookView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 7/11/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var date: Date?
    
    var fechaFormateada: String {
        if let fecha = date {
        let  formateador = DateFormatter()
        formateador.dateStyle = .short
        return formateador.string(from: fecha)
        } else {
            return "N/A"
        }
    }
    
    
    let genres = ["Fantasy","Horror","Kids","Mistery","Romance","Thriller","No Genre"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Título", text: $title)
                    TextField("Autor", text: $author)
                    
                    Picker("Género", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Text(fechaFormateada)
                    RatingView(rating: $rating)
                    TextField("Escribe una reseña", text: $review)
                }
                Section {
                    Button("Guardar") {
                        //añadir un libro
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = self.date
                        
                        try? self.moc.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Añade un libro")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
