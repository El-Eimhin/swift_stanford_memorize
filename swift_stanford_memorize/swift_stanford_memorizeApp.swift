//
//  swift_stanford_memorizeApp.swift
//  swift_stanford_memorize
//
//  Created by Éimhín Ward  on 27/05/2021.
//

import SwiftUI

@main
struct swift_stanford_memorizeApp: App {
   
    private let game = EmojiMemoryGame()
   
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}
