//
//  AddBookView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 10/12/24.
//

import SwiftUI
import PhotosUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: BookViewModel
    
    @State private var bookName = ""
    @State private var authorName = ""
    @State private var synopsis = ""
    @State private var bookImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var selectedStatus: BookStatus = .toRead
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Name", text: $bookName)
                    TextField("Author", text: $authorName)
                }
                
                Section(header: Text("Synopsis")) {
                    TextField("Add", text: $synopsis)
                }
                
                Section(header: Text("Cover")) {
                    if let bookImage = bookImage {
                        Image(uiImage: bookImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                    } else {
                        Button(action: {
                            isShowingImagePicker = true
                        }) {
                            Text("Select image")
                                .foregroundColor(.blue)
                        }
                    }
                }

                Section(header: Text("Status")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Button(action: {
                            selectedStatus = .reading
                        }) {
                            Text("Reading")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedStatus == .reading ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedStatus == .reading ? .white : .black)
                                .cornerRadius(8)
                        }
                        .buttonStyle(BorderlessButtonStyle()) // Asegura que el botón funcione correctamente dentro del VStack

                        Button(action: {
                            selectedStatus = .toRead
                        }) {
                            Text("Wanting to Read")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedStatus == .toRead ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedStatus == .toRead ? .white : .black)
                                .cornerRadius(8)
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        Button(action: {
                            selectedStatus = .toReady
                        }) {
                            Text("Already Read")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedStatus == .toReady ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedStatus == .toReady ? .white : .black)
                                .cornerRadius(8)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.vertical)
                }
                
            }
            .navigationTitle("Add Book")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newBook = Book(name: bookName, author: authorName, image: bookImage, status: selectedStatus, synopsis: synopsis)
                        viewModel.addBook(newBook)
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $bookImage)
            }
        }
    }
}

#Preview {
    AddBookView(viewModel: BookViewModel())
}
