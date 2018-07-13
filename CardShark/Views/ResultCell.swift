//
//  ResultCell.swift
//  CardShark
//
//  Created by Angela Yu on 7/13/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    var card: Card! {
        didSet {
            if let name = card.name {
                nameLabel.text = name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.accessoryType = .disclosureIndicator
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
