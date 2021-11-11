//
//  DetailView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 9/11/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre ?? "Fantasy")
                    Text(book.genre ?? "Sin género")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(book.genre?.uppercased() ?? "FANTASÍA")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                    //.background(.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(book.author ?? "Autor desconocido")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(book.review ?? "Sin reseña")
                    .padding()
                
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(title: Text("Borrar libro"), message: Text("¿Estás seguro?"), primaryButton: .destructive(Text("Borrar")) {
                    self.deleteBook()
                }, secondaryButton: .cancel()
                )
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
        .navigationTitle(book.title ?? "Sin título")
        .navigationBarTitleDisplayMode(.inline)
    }
    func deleteBook() {
        moc.delete(book)
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    //moc ManagedObjectContext
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 2
        book.review = "No me ha gustado"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
