//
//  QuoteDayView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 17/12/24.
//

import SwiftUI

struct QuoteDayView: View {
    let motivationalQuotes = [
        "“A book is a dream that you hold in your hands.” – Neil Gaiman",
        "“The person who reads much and travels much, sees much and knows much.” – Miguel de Cervantes",
        "“A reader lives a thousand lives before he dies. The man who never reads lives only one.” – George R.R. Martin",
        "“There is no friend as loyal as a book.” – Ernest Hemingway",
        "“Books are a uniquely portable magic.” – Stephen King",
        "“The only thing you absolutely have to know is the location of the library.” – Albert Einstein",
        "“We lose ourselves in books, we find ourselves there too.” – Anonymous",
        "“Good friends, good books, and a sleepy conscience: this is the ideal life.” – Mark Twain",
        "“The world was hers for the reading.” – Betty Smith, *A Tree Grows in Brooklyn*",
        "“I have always imagined that Paradise will be a kind of library.” – Jorge Luis Borges",
        "“You can never get a cup of tea large enough or a book long enough to suit me.” – C.S. Lewis",
        "“Books are the mirrors of the soul.” – Virginia Woolf",
        "“There is no Frigate like a Book to take us Lands away.” – Emily Dickinson",
        "“The man who does not read has no advantage over the man who cannot read.” – Mark Twain",
        "“A great book should leave you with many experiences, and slightly exhausted at the end. You live several lives while reading it.” – William Styron",
        "“In books, I have traveled, not only to other worlds, but into my own.” – Anna Quindlen",
        "“A room without books is like a body without a soul.” – Marcus Tullius Cicero",
        "“Reading is a conversation. All books talk. But a good book listens as well.” – Mark Haddon",
        "“The more that you read, the more things you will know. The more that you learn, the more places you'll go.” – Dr. Seuss"
    ]

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Quote of the day")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text(motivationalQuotes.randomElement()!)
                .font(.subheadline)
                .italic()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
        }
        .padding([.leading, .trailing], 10) // Márgenes laterales para reducir el espacio
        .background(Color.orange.opacity(0.1))
        .cornerRadius(15)
        .frame(maxWidth: .infinity)
    }
}

struct QuoteOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDayView()
    }
}
