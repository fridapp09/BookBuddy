//
//  HomepageView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 10/12/24.
//

import SwiftUI

struct HomepageView: View {
    @Binding var pagesReadForDay: [Date: Int]
    @Binding var totalPagesRead: Int
    
    // Función para obtener el libro basado en el día actual
    func getBookOfTheDay() -> BookMonthView {
        let today = Calendar.current.component(.day, from: Date()) // Obtener el día del mes
        return monthlyBooks[today % monthlyBooks.count] // Seleccionar un libro según el día
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Resumen de actividad
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Pages Read")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("You have read \(totalPagesRead) pages") // Usamos totalPagesRead directamente
                                .font(.title2)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(15)
                    
                    // Libro actual
                    let bookOfTheDay = getBookOfTheDay() // Obtener el libro del día
                    VStack(alignment: .leading) {
                        Text("Book of the Day")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)

                        HStack(alignment: .center) {
                            // Imagen del libro
                            if let image = bookOfTheDay.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150) // Ajusta el tamaño de la imagen
                                    .cornerRadius(10)
                                    .padding(.trailing, 15)
                            }

                            // Título y autor del libro
                            VStack {
                                Spacer() // Esto centra el texto verticalmente con la imagen
                                Text(bookOfTheDay.title)
                                    .font(.title2)
                                    .bold()
                                Text("by \(bookOfTheDay.author)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Spacer() // Esto asegura que el texto esté centrado
                            }
                        }
                        .padding(.bottom)

                        // Enlace a los detalles del libro
                        NavigationLink(destination: DetailMonthView(book: bookOfTheDay)) {
                            Text("See Details")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(15)

                    QuoteDayView() // Este es el View para las frases motivacionales

                    // Botón para abrir el temporizador
                    VStack(alignment: .leading) {
                        Text("Timer")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                        
                        NavigationLink(destination: TimeView()) {
                            HStack {
                                Text("Start Reading")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.purple)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(15)
                }
                .padding()
            }
            .navigationTitle("BookBuddy")
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        // Creamos valores predeterminados para las páginas leídas
        HomepageView(
            pagesReadForDay: .constant([Date(): 100]),
            totalPagesRead: .constant(500)
        )
    }
}

