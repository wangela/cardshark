//
//  WalletTableViewCell.swift
//  CardShark
//
//  Created by Angela Yu on 6/19/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
