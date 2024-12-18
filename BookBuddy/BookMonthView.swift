//
//  BookMonthView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 12/12/24.
//

import SwiftUI

struct BookMonthView: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let image: UIImage?
    let synopsis: String
}

//Books of the month
let monthlyBooks: [BookMonthView] = [
    BookMonthView(
        title: "One Hundred Years of Solitude",
        author: "Gabriel García Márquez",
        image: UIImage(named: "one_hundred_years_of_solitude"), // Usa el nombre correcto de la imagen
        synopsis: "A masterpiece of magical realism that tells the multi-generational story of the Buendía family in the fictional town of Macondo."
    ),
    BookMonthView(
        title: "Don Quixote",
        author: "Miguel de Cervantes",
        image: UIImage(named: "don_quixote"),
        synopsis: "The comedic and tragic adventures of Don Quixote and Sancho Panza as they pursue chivalric ideals."
    ),
    BookMonthView(
        title: "Pride and Prejudice",
        author: "Jane Austen",
        image: UIImage(named: "pride-and-prejudice"),
        synopsis: "A classic novel that explores love, society, and misunderstandings through the relationship between Elizabeth Bennet and Mr. Darcy."
    ),
    BookMonthView(
        title: "1984",
        author: "George Orwell",
        image: UIImage(named: "1984"),
        synopsis: "A dystopian novel set in a totalitarian society ruled by Big Brother, exploring themes of surveillance, truth, and individual freedom."
    ),
    BookMonthView(
        title: "Crime and Punishment",
        author: "Fyodor Dostoevsky",
        image: UIImage(named: "crime_and_punishment"),
        synopsis: "A psychological novel that delves into the mind of Raskolnikov, a man who struggles with guilt after committing a murder."
    ),
    BookMonthView(
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        image: UIImage(named: "to_kill_a_mockingbird"),
        synopsis: "A poignant exploration of racial injustice and moral growth through the eyes of young Scout Finch in the American South."
    ),
    BookMonthView(
        title: "Moby Dick",
        author: "Herman Melville",
        image: UIImage(named: "moby_dick"),
        synopsis: "An epic tale of obsession and revenge, following Captain Ahab's relentless pursuit of the white whale, Moby Dick."
    ),
    BookMonthView(
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        image: UIImage(named: "the_great_gatsby"),
        synopsis: "A critique of the American Dream through the tragic story of Jay Gatsby and his pursuit of wealth and lost love."
    ),
    BookMonthView(
        title: "Around the World in Eighty Days",
        author: "Jules Verne",
        image: UIImage(named: "around_the_world"),
        synopsis: "A thrilling adventure of Phileas Fogg's race to circumnavigate the globe in 80 days."
    ),
    BookMonthView(
        title: "The Divine Comedy",
        author: "Dante Alighieri",
        image: UIImage(named: "the_divine_comedy"),
        synopsis: "An epic poem that narrates Dante's journey through Hell, Purgatory, and Heaven, exploring themes of sin, redemption, and divine justice."
    ),
    BookMonthView(
        title: "The War of the Worlds",
        author: "H.G. Wells",
        image: UIImage(named: "war_of_the_worlds"),
        synopsis: "A science fiction novel depicting humanity's struggle against an alien invasion."
    ),
    BookMonthView(
        title: "Anna Karenina",
        author: "Leo Tolstoy",
        image: UIImage(named: "anna_karenina"),
        synopsis: "A sweeping tale of love, betrayal, and societal norms, centered on the life of Anna Karenina and her tragic affair."
    ),
    BookMonthView(
        title: "Treasure Island",
        author: "Robert Louis Stevenson",
        image: UIImage(named: "treasure_island"),
        synopsis: "The adventure of young Jim Hawkins as he joins a crew of pirates searching for treasure on a remote island, filled with danger, mystery, and buried treasure."
    ),
    BookMonthView(
        title: "The Adventures of Tom Sawyer",
        author: "Mark Twain",
        image: UIImage(named: "tom_sawyer"),
        synopsis: "The adventures of a mischievous boy named Tom Sawyer, who lives along the Mississippi River, gets into trouble, and has thrilling experiences with his friends."
    ),
    BookMonthView(
        title: "The Phantom of the Opera",
        author: "Gaston Leroux",
        image: UIImage(named: "phantom_of_the_opera"),
        synopsis: "A gothic romance of unrequited love and obsession set in the Paris Opera House."
    ),
    BookMonthView(
        title: "The Secret Garden",
        author: "Frances Hodgson Burnett",
        image: UIImage(named: "the_secret_garden"),
        synopsis: "A heartwarming story of healing and friendship as a young girl discovers a hidden garden."
    ),
    BookMonthView(
        title: "The Odyssey",
        author: "Homer",
        image: UIImage(named: "the_odyssey"),
        synopsis: "An ancient Greek epic poem recounting the hero Odysseus's long and perilous journey home after the Trojan War."
    ),
    BookMonthView(
        title: "Les Misérables",
        author: "Victor Hugo",
        image: UIImage(named: "les_miserables"),
        synopsis: "A sweeping tale of redemption, justice, and love, set against the backdrop of revolutionary France."
    ),
    BookMonthView(
        title: "Jane Eyre",
        author: "Charlotte Brontë",
        image: UIImage(named: "jane_eyre"),
        synopsis: "The story of an independent and resilient orphan who overcomes hardships to find love and self-respect."
    ),
    BookMonthView(
        title: "The Shadow of the Wind",
        author: "Carlos Ruiz Zafón",
        image: UIImage(named: "the_shadow_of_the_wind"),
        synopsis: "A mystery and adventure novel set in post-war Barcelona, following a young man named Daniel Sempere as he unravels the secrets of a disappeared author."
    ),
    BookMonthView(
        title: "Pedro Páramo",
        author: "Juan Rulfo",
        image: UIImage(named: "pedro_paramo"),
        synopsis: "A dark story about death, despair, and oppression, where a man named Juan Preciado travels to Comala in search of his father, Pedro Páramo, only to find a town inhabited by ghosts."
    ),
    BookMonthView(
        title: "The Picture of Dorian Gray",
        author: "Oscar Wilde",
        image: UIImage(named: "dorian_gray"),
        synopsis: "A gothic novel about a man who remains young while his portrait ages, exploring vanity and moral corruption."
    ),
    BookMonthView(
        title: "Frankenstein",
        author: "Mary Shelley",
        image: UIImage(named: "frankenstein"),
        synopsis: "A gothic novel exploring the consequences of playing God through Victor Frankenstein's creation."
    ),
    BookMonthView(
        title: "The Count of Monte Cristo",
        author: "Alexandre Dumas",
        image: UIImage(named: "count_of_monte_cristo"),
        synopsis: "A gripping tale of revenge, justice, and betrayal, as Edmond Dantès escapes from prison and seeks to ruin the men who wronged him."
    ),
    BookMonthView(
        title: "Harry Potter and the Sorcerer's Stone",
        author: "J.K. Rowling",
        image: UIImage(named: "harry-potter"),
        synopsis: "The first book in the Harry Potter series, where a young boy discovers he is a wizard and embarks on a magical journey at Hogwarts School of Witchcraft and Wizardry."
    ),
    BookMonthView(
        title: "The Chronicles of Narnia: The Lion, the Witch, and the Wardrobe",
        author: "C.S. Lewis",
        image: UIImage(named: "chronicles_of_narnia"),
        synopsis: "The first book in the Chronicles of Narnia series, where four children enter a magical world through a wardrobe and help Aslan, the noble lion, fight the White Witch."
    ),
    BookMonthView(
        title: "The Hobbit",
        author: "J.R.R. Tolkien",
        image: UIImage(named: "the_hobbit"),
        synopsis: "The prequel to 'The Lord of the Rings,' following the journey of Bilbo Baggins, a hobbit who becomes a hero in a quest to reclaim a treasure guarded by the dragon Smaug."
    ),
    BookMonthView(
        title: "The Little Prince",
        author: "Antoine de Saint-Exupéry",
        image: UIImage(named: "little_prince"),
        synopsis: "A poetic tale about a young prince who travels from planet to planet, meeting various strange characters, and discovering important life lessons about love, loss, and human nature."
    ),
    BookMonthView(
        title: "The Metamorphosis",
        author: "Franz Kafka",
        image: UIImage(named: "the_metamorphosis"),
        synopsis: "A surreal story of Gregor Samsa, who wakes up transformed into a giant insect, symbolizing alienation and societal pressure."
    ),
    BookMonthView(
        title: "Little Women",
        author: "Louisa May Alcott",
        image: UIImage(named: "little_women"),
        synopsis: "The coming-of-age story of four sisters—Meg, Jo, Beth, and Amy—growing up in New England during the Civil War, focusing on their dreams, struggles, and relationships."
    ),
]
