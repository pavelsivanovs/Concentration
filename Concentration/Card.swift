//
//  Card.swift
//  Concentration
//
//  Created by dev on 15/06/2019.
//  Copyright © 2019 dev. All rights reserved.
//

import Foundation

struct Card: Hashable
{
//    var hashValue: Int {return identifier}
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    private var identifier: Int
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    var isFaceUp = false
    var isMatched = false
    
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
