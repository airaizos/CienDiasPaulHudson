//
//  CurrentView.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 9/11/21.
//

import SwiftUI


struct CurrentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true), NSSortDescriptor(keyPath: \Book.author, ascending: true),
        ]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id:\.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Sin título")
                                .font(.headline)
                                .foregroundColor(book.rating == 1 ? .red : .black)
                            Text(book.author ?? "Sin autor")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("BookWorm")
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
                }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
        }
        
      
            try? self.moc.save()
    
        
    }
}

struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView()
    }
}
