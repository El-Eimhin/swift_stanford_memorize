//
//  EmojiMemoryGame.swift
//  swift_stanford_memorize
//
//  Created by Éimhín Ward  on 28/05/2021.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["✈️","🚀","🚁","🚜", "🚘","😀","🛵","🚟","🛻","🚔","🚑","🏎","🦼","🛴","🦽","🚂","🚓","🚍","🏍","🚕","🦯","🧭", "⚖️","💣"]
    
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

