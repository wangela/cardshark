//
//  WalletViewController.swift
//  CardShark
//
//  Created by Angela Yu on 6/19/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit
import AFNetworking

class WalletViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var walletTable: UITableView!
    var fetchedCards: [Card?] = []
    var numCards = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletTable.dataSource = self
        walletTable.delegate = self
        walletTable.rowHeight = UITableViewAutomaticDimension
        walletTable.estimatedRowHeight = 124
        
        fetchedCards = fetchCards()
        numCards = fetchedCards.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Fetch Cards
    func fetchCards() -> [Card] {
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
        
        let card1 = Card(dictionary: card1dict)
        let card2 = Card(dictionary: card2dict)
        
        let cards = [card1, card2]
        
        return cards
    }
    
    // MARK: TableView setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numCards + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row < numCards) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
            guard let cellCard = fetchedCards[indexPath.row] else {
                cell.card = Card(dictionary: [:])
                return cell
            }
            cell.card = cellCard
            return cell
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)
        }
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
