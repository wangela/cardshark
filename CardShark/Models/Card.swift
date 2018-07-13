//
//  Card.swift
//  CardShark
//
//  Created by Angela Yu on 7/10/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class Card: NSObject {
    let id: String?
    let name: String?
    let network: String?
    let issuer: String?
    let descriptionText: String?
    let bonuses: [String: [Any]]?
    let imageURL: URL?
    var imageAsset: UIImage?
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        network = dictionary["network"] as? String
        issuer = dictionary["issuer"] as? String
        descriptionText = dictionary["descriptionText"] as? String
        bonuses = dictionary["bonuses"] as? [String: [Any]]
        imageAsset = nil
        
       if let imageURLString = dictionary["image_url"] as? String {
        imageURL = URL(string: imageURLString)
       } else {
        imageURL = nil
       }
    }

}
