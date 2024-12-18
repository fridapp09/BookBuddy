//
//  CalendarView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 16/12/24.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first { $0.isKeyWindow }?.endEditing(force)
        }
    }
}

struct CalendarView: View {
    // Estructura para almacenar la fecha y el número de páginas leídas ese día
    struct ReadDay: Codable {
        let date: Date
        var pagesRead: Int
    }
    
    // Estado para almacenar los días leídos con el número de páginas
    @State private var readDays: [ReadDay] = []
    
    // Estado para manejar la fecha seleccionada y el número de páginas
    @State private var selectedDate: Date = Date()
    @State private var pagesRead: String = ""
    
    @Binding var totalPagesRead: Int // Binding a totalPagesRead
    
    // Función para verificar si ya se ha registrado un día con páginas leídas
    func pagesReadForDate(_ date: Date) -> Int? {
        return readDays.first { Calendar.current.isDate($0.date, inSameDayAs: date) }?.pagesRead
    }
    
    var body: some View {
        NavigationView { // Envuelve todo en un NavigationView
            VStack(spacing: 15) { // Espaciado reducido
                // Calendario: Usamos DatePicker con un estilo gráfico para mostrar un calendario
                Text("Did you read today?")
                    .font(.title)
                    .padding(.top, 15)
                
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding([.leading, .trailing], 15) // Márgenes laterales para reducir el espacio
                
                // Utiliza un ZStack para garantizar que al tocar afuera se cierre el teclado
                ZStack {
                    Color.clear // Hacer que el fondo sea tocable
                    VStack {
                        // Campo para ingresar las páginas leídas
                        TextField("Enter pages read", text: $pagesRead)
                            .keyboardType(.numberPad)
                            .padding([.leading, .trailing], 15) // Márgenes laterales
                            .padding(.vertical, 8) // Reducir el espaciado vertical
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .padding(.top, 5)
                        
                        // Mostrar las páginas leídas para el día seleccionado
                        if let pages = pagesReadForDate(selectedDate) {
                            Text("Pages Read: \(pages)")
                                .padding(.top, 20)
                        }
                        
                        
                        Spacer() // Este Spacer asegura que el botón quede en la parte inferior
                        
                        // Botón para añadir el día y el número de páginas leídas
                        Button(action: {
                            if let pages = Int(pagesRead), pages > 0 {
                                
                                // Cerrar el teclado
                                UIApplication.shared.endEditing(true)
                                
                                // Verificar si ya existe una entrada para esta fecha
                                if let index = readDays.firstIndex(where: {
                                    Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) {
                                    
                                    // Si ya existe, actualizamos la cantidad de páginas leídas
                                    let oldPages = readDays[index].pagesRead
                                    readDays[index].pagesRead = pages
                                    totalPagesRead += (pages - oldPages) // Ajustar el total de páginas leídas (restar las páginas viejas y sumar las nuevas)
                                } else {
                                    // Si no existe, agregamos una nueva entrada
                                    let newReadDay = ReadDay(date: selectedDate, pagesRead: pages)
                                    readDays.append(newReadDay)
                                    totalPagesRead += pages // Añadir las páginas leídas al total
                                }
                                pagesRead = ""  // Limpiar el campo de texto
                            }
                        }) {
                            Text("Add Pages")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .onTapGesture {
                    // Dismiss keyboard when tapping outside the TextField
                    UIApplication.shared.dismissKeyboard()
                }
            }
            .padding()
            .navigationTitle("Calendar")
        }
    }
}

// Función para formatear la fecha de manera legible
func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}

extension UIApplication {
    func dismissKeyboard() {
        windows.first(where: { $0.isKeyWindow })?.endEditing(true)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(totalPagesRead: .constant(0))
    }
}
