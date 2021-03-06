//
//  MemoryGame.swift
//  swift_stanford_memorize
//
//  Created by Éimhín Ward  on 28/05/2021.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards : Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get { cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly}
        set {cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}
    }
    mutating func choose( _ card: Card) {

        if let chosenIndex = cards.firstIndex(
            where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                }
                cards[chosenIndex].isFaceUp = true
            } else{
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent:(Int)->CardContent){
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content,id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
       
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

struct MemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
extension Array{
    var oneAndOnly: Element?{
        if count == 1{
            return self.first
        }
        else {
            return nil
        }
    }
    
}
