//
//  Client.swift
//  CardShark
//
//  Created by Angela Yu on 7/11/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

let card1dict: NSDictionary = [
    "id": 1,
    "name": "Chase Sapphire Reserve",
    "network": "Visa",
    "issuer": "Chase",
    "descriptionText": "An indestructible card with Ultimate Rewards for ultimate flexibility."
]
let card2dict: NSDictionary = [
    "id": 2,
    "name": "Discover",
    "network": "Discover",
    "issuer": "Discover",
    "descriptionText": "Great for free pretzels at Auntie Anne's."
]
let card3dict: NSDictionary = [
    "id": 3,
    "name": "Amazon Rewards",
    "network": "Visa",
    "issuer": "Chase",
    "descriptionText": "Everything from A to Z."
]
let card4dict: NSDictionary = [
    "id": 4,
    "name": "American Express Onyx",
    "network": "American Express",
    "issuer": "American Express",
    "descriptionText": "Onyx is blacker than black."
]
let card5dict: NSDictionary = [
    "id": 5,
    "name": "Chase Emerald Reserve",
    "network": "Visa",
    "issuer": "Chase",
    "descriptionText": "A sparkling card with cash back."
]
let card6dict: NSDictionary = [
    "id": 6,
    "name": "Explore",
    "network": "Discover",
    "issuer": "Explore",
    "descriptionText": "Great for free rolls at Cinnabon."
]

class Client {
    static let sharedInstance = Client()
    
    let card1 = Card(dictionary: card1dict)
    let card2 = Card(dictionary: card2dict)
    let card3 = Card(dictionary: card3dict)
    let card4 = Card(dictionary: card4dict)
    let card5 = Card(dictionary: card5dict)
    let card6 = Card(dictionary: card6dict)
    var wallet: [Card]
    
    init() {
        card1.imageAsset = #imageLiteral(resourceName: "sapphire")
        card2.imageAsset = #imageLiteral(resourceName: "discover")
        card3.imageAsset = #imageLiteral(resourceName: "amazon")
        card4.imageAsset = #imageLiteral(resourceName: "amex")
        card5.imageAsset = #imageLiteral(resourceName: "sapphire")
        card6.imageAsset = #imageLiteral(resourceName: "discover")
        
        wallet = [card4, card2]
    }
    
    func search(term: String) -> [Card]? {
        let cards = [card5, card6]
        return cards
    }
    
    func getPopularCards() -> [Card] {
        let cards = [card1, card3, card2]
        
        return cards
    }
    
    func getWalletCards() -> [Card] {
        // TODO: Cache wallet in local device?
        return wallet
    }
    
    func addCardToWallet(card: Card) {
        // TODO: Persist wallet across sessions
        wallet.append(card)
    }

}
