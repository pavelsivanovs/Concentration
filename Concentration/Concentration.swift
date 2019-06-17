//
//  Concentration.swift
//  Concentration
//
//  Created by dev on 15/06/2019.
//  Copyright © 2019 dev. All rights reserved.
//

import Foundation

class Concentration
{
    
    /* this class is a model part
     thus explaining WHAT this program does
     but NOT HOW. HOW part is explained in CONTROLLER part which connects VIEW and MODEL */
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        var tempCards = cards
        for i in cards.indices {
            let tIndex = Int(arc4random_uniform(UInt32(tempCards.count)))
            cards[i] = tempCards.remove(at: tIndex)
        }
    }
}
