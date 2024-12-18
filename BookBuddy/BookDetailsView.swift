//
//  BookDetailsView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 16/12/24.
//

import SwiftUI

struct BookDetailsView: View {
    @State var book: Book
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Mostrar la imagen del libro si está disponible
                if let image = book.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .padding(.top, 10)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 250)
                        .cornerRadius(10)
                }
                
                Text("by \(book.author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                // Mostrar la sinopsis si está disponible, sino mostrar un mensaje alternativo
                if let synopsis = book.synopsis, !synopsis.isEmpty {
                    Text(synopsis)
                        .font(.body)
                        .padding(.top, 10)

                } else {
                    Text("No synopsis available.")
                        .font(.body)
                        .italic()
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                
                // Agregar un botón para editar el libro
                NavigationLink(destination: EditDetailsView(book: $book)) {
                    Text("Edit Book Details")
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading) // Asegurarse de que ocupe todo el ancho posible
        }
        .navigationTitle(book.name) // Título de la vista basado en el nombre del libro
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: Book(
            name: "Example Book Title",
            author: "Example Author",
            image: UIImage(named: "harry-potter"),
            status: .toRead,
            synopsis: "This is a sample synopsis for the book. It gives an idea of what the book is about."
        ))
        .previewLayout(.sizeThatFits)
    }
}
