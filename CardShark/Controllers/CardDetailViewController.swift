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
    @IBOutlet var addButton: UIButton!
    
    var card: Card!
    var forAddScreen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.]
        addButton.isHidden = !forAddScreen
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
        card.setImage(for: cardImageView)
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
    @IBAction func onAddButton(_ sender: Any) {
        Client.sharedInstance.addCardToWallet(card: self.card)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
