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
    private lazy var imageAsset: UIImage? = nil
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        network = dictionary["network"] as? String
        issuer = dictionary["issuer"] as? String
        descriptionText = dictionary["descriptionText"] as? String
        bonuses = dictionary["bonuses"] as? [String: [Any]]
        
        if let imageURLString = dictionary["image_url"] as? String {
            imageURL = URL(string: imageURLString)
        } else {
            imageURL = nil
        }
    }
    
    func addImage(asset: UIImage?) -> Void {
        guard let asset = asset else {
            return
        }
        self.imageAsset = asset
    }
    
    func setImage(for imageView: UIImageView) -> Void {
        guard let imageURL = self.imageURL else {
            guard let cardImage = self.imageAsset else {
                imageView.image = #imageLiteral(resourceName: "add")
                return
            }
            imageView.image = cardImage
            return
        }
        // TODO: Hook up to backend to source card images
        imageView.setImageWith(imageURL)
    }

}
