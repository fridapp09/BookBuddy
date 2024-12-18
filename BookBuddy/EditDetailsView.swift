//
//  EditDetailsView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 16/12/24.
//

import SwiftUI
import PhotosUI

struct EditDetailsView: View {
    @Binding var book: Book
    @Environment(\.dismiss) var dismiss // Para cerrar la vista al guardar
    @State private var bookName: String
    @State private var authorName: String
    @State private var synopsis: String
    @State private var selectedStatus: BookStatus
    @State private var bookImage: UIImage?
    @State private var isShowingImagePicker = false
    
    init(book: Binding<Book>) {
        _book = book
        _bookName = State(initialValue: book.wrappedValue.name)
        _authorName = State(initialValue: book.wrappedValue.author)
        _synopsis = State(initialValue: book.wrappedValue.synopsis ?? "")
        _selectedStatus = State(initialValue: book.wrappedValue.status)
        _bookImage = State(initialValue: book.wrappedValue.image)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Book Name", text: $bookName)
                    TextField("Author Name", text: $authorName)
                    TextField("Synopsis", text: $synopsis)
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
                        .buttonStyle(BorderlessButtonStyle())

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
            .navigationTitle("Edit Book")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Actualizar el libro con los nuevos valores
                        book.name = bookName
                        book.author = authorName
                        book.synopsis = synopsis
                        book.status = selectedStatus
                        book.image = bookImage
                        
                        dismiss() // Cerrar la vista después de guardar los cambios
                    }
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $bookImage)
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                DispatchQueue.main.async {
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
