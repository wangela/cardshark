//
//  CardDetailViewController.swift
//  CardShark
//
//  Created by Angela Yu on 7/13/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var cardDescriptionLabel: UILabel!
    
    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.]
        if let name = card.name {
            cardNameLabel.text = name
        } else {
            cardNameLabel.text = "Card Name"
        }
        if let description = card.descriptionText {
            cardDescriptionLabel.text = description
        } else {
            cardDescriptionLabel.text = "Card Description"
        }
        if let imageURL = card.imageURL {
            // TODO: Hook up to backend to source card images
            cardImageView.setImageWith(imageURL)
        } else {
            cardImageView.image = #imageLiteral(resourceName: "sapphire")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
