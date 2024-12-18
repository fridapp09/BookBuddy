//
//  DetailMonthView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 12/12/24.
//

import SwiftUI

struct DetailMonthView: View {
    let book: BookMonthView
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let image = book.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .padding(.bottom)
                }
                Text(book.title)
                    .font(.title)
                    .bold()
                Text("by \(book.author)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(book.synopsis)
                    .font(.body)
                    .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Book Details")
    }
}

#Preview {
    DetailMonthView(book: monthlyBooks.first!)
}
