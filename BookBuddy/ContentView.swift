//
//  ContentView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    // State variable for pages read per day
    @State private var pagesReadForDay: [Date: Int] = [:]
    
    // State variable for total pages read
    @State private var totalPagesRead: Int = 0

    var body: some View {
        TabView {
            HomepageView(pagesReadForDay: $pagesReadForDay, totalPagesRead: $totalPagesRead)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            MyBooksView()
                .tabItem {
                    Label("My Books", systemImage: "books.vertical")
                }
            
            CalendarView(totalPagesRead: $totalPagesRead)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    ContentView()
}
