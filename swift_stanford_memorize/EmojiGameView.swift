//
//  ContentView.swift
//  swift_stanford_memorize
//
//  Created by Éimhín Ward  on 27/05/2021.
//

import SwiftUI

struct EmojiGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
   
    var body: some View {
        
        
        VStack{
            
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                   
                    ForEach(game.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .padding(.horizontal)
    }
    
}
 

struct CardView: View {
    
    let card: EmojiMemoryGame.Card

   
    
    var body: some View{
       
        GeometryReader(content: { geometry in
            ZStack {
                
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                
                if card.isFaceUp {
                
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                    
                    
                } else if card.isMatched {
                    shape.opacity(0)
                    
                }
                else {
                   shape.fill()
                }
            }
        })
    }
    
    
    private func font(in size:CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.emojiScalingFactor)
    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 20
        static let emojiScalingFactor: CGFloat = 0.75
        static let lineWidth: CGFloat = 3
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        let game = EmojiMemoryGame()
        EmojiGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiGameView(game: game)
    }
}
