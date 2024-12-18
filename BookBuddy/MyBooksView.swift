//
//  MyBooksView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 10/12/24.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    
    var body: some View {
        NavigationLink(destination: BookDetailsView(book: book)) {
            HStack {
                if let image = book.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                }
                VStack(alignment: .leading) {
                    Text(book.name)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle()) // Para evitar el estilo por defecto del botón de navegación
    }
}


// Modelo Book
struct Book: Identifiable {
    var id = UUID()
    var name: String
    var author: String
    var image: UIImage?
    var status: BookStatus
    var synopsis: String?
}

enum BookStatus {
    case reading
    case toRead
    case toReady
}

struct MyBooksView: View {
    @StateObject private var viewModel = BookViewModel()
    @State private var isAddingBook = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.books.isEmpty {
                    Spacer(minLength: 270)
                    Text("You don't have any books yet.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    VStack(alignment: .leading, spacing: 20) {
                        // Sección "Leyendo"
                        if !viewModel.readingBooks.isEmpty {
                            Text("Reading")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(viewModel.readingBooks) { book in
                                        NavigationLink(destination: BookDetailsView(book: book)) {
                                            BookCoverView(book: book)
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Para evitar el estilo de botón predeterminado
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Sección "Quiero Leer"
                        if !viewModel.toReadBooks.isEmpty {
                            Text("Want to Read")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(viewModel.toReadBooks) { book in
                                        NavigationLink(destination: BookDetailsView(book: book)) {
                                            BookCoverView(book: book)
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Para evitar el estilo de botón predeterminado
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Sección "Ya leí"
                        if !viewModel.toReadyBooks.isEmpty {
                            Text("Already Read")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(viewModel.toReadyBooks) { book in
                                        NavigationLink(destination: BookDetailsView(book: book)) {
                                            BookCoverView(book: book)
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Para evitar el estilo de botón predeterminado
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingBook = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingBook) {
                AddBookView(viewModel: viewModel)
            }
        }
    }
}


struct BookCoverView: View {
    let book: Book
    let fixedSize: CGSize = CGSize(width: 100, height: 140) // Tamaño fijo de la portada

    var body: some View {
        VStack {
            if let image = book.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill() // Asegura que la imagen llene el espacio
                    .frame(width: fixedSize.width, height: fixedSize.height) // Aplica tamaño uniforme
                    .clipped() // Recorta el contenido que exceda el marco
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: fixedSize.width, height: fixedSize.height) // Tamaño uniforme para portadas sin imagen
                    .cornerRadius(10)
            }
            Text(book.name)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
        }
    }
}


#Preview {
    MyBooksView()
}
