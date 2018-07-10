//
//  CardTableViewCell.swift
//  CardShark
//
//  Created by Angela Yu on 6/19/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit
import AFNetworking

class CardTableViewCell: UITableViewCell {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardLabel: UILabel!
    
    var card: Card! {
        didSet {
            if let name = card.name {
                cardLabel.text = name
            }
            if let imageURL = card.imageURL {
                // TODO: Hook up to backend to source card images
                cardImageView.setImageWith(imageURL)
            } else {
                cardImageView.image = #imageLiteral(resourceName: "sapphire")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
