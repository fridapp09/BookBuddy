//
//  BookViewModel.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 11/12/24.
//

import SwiftUI

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []

    var readingBooks: [Book] {
        books.filter { $0.status == .reading }
    }

    var toReadBooks: [Book] {
        books.filter { $0.status == .toRead }
    }

    var toReadyBooks: [Book] {
        books.filter { $0.status == .toReady }
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func updateBook(originalBook: Book, with updatedBook: Book) {
        if let index = books.firstIndex(where: { $0.id == originalBook.id }) {
            books[index] = updatedBook
        }
    }
}
