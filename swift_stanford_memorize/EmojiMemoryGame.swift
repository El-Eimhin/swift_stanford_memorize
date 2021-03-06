//
//  EmojiMemoryGame.swift
//  swift_stanford_memorize
//
//  Created by ÃimhÃ­n Ward  on 28/05/2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["âï¸","ð","ð","ð", "ð","ð","ðµ","ð","ð»","ð","ð","ð","ð¦¼","ð´","ð¦½","ð","ð","ð","ð","ð","ð¦¯","ð§­", "âï¸","ð£"]
    
    private static func createMemoryGame () -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 16) { pairIndex in
        emojis[pairIndex]}
    }
    
    @Published private var model = createMemoryGame()
        
    
    var cards: Array<Card> {
        return model.cards
        
    }
    
    //MARK: - Intents
    
    func choose(_ card: Card){
        
        model.choose(card)
    }
}

