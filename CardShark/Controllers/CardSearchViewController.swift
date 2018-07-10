//
//  CardSearchViewController.swift
//  CardShark
//
//  Created by Angela Yu on 6/20/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class CardSearchViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var resultsTableView: UITableView!
    let sectionTitles = ["Matching Cards", "Popular Cards"]
    var popCards: [Card?] = []
    var resultCards: [Card?] = []
    var numPopular = 0
    var numSuggested = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        resultsTableView.estimatedRowHeight = 124
        
        popCards = fetchPopularCards()
        numPopular = popCards.count
        
        resultCards = fetchResultCards()
        numSuggested = resultCards.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Cards fetching
    func fetchResultCards() -> [Card] {
        let card1dict: NSDictionary = [
            "id": 1,
            "name": "Chase Emerald Reserve",
            "network": "Visa",
            "issuer": "Chase",
            "descriptionText": "An sparkling card with cash back."
        ]
        let card2dict: NSDictionary = [
            "id": 2,
            "name": "Explore",
            "network": "Discover",
            "issuer": "Explore",
            "descriptionText": "Great for free rolls at Cinnabon."
        ]
        
        let card1 = Card(dictionary: card1dict)
        let card2 = Card(dictionary: card2dict)
        
        let cards = [card1, card2]
        
        return cards
    }
    
    func fetchPopularCards() -> [Card] {
        let card3dict: NSDictionary = [
            "id": 3,
            "name": "Chase Sapphire Reserve",
            "network": "Visa",
            "issuer": "Chase",
            "descriptionText": "An indestructible card with Ultimate Rewards for ultimate flexibility."
        ]
        let card4dict: NSDictionary = [
            "id": 4,
            "name": "Discover",
            "network": "Discover",
            "issuer": "Discover",
            "descriptionText": "Great for free pretzels at Auntie Anne's."
        ]
        
        let card3 = Card(dictionary: card3dict)
        let card4 = Card(dictionary: card4dict)
        
        let cards = [card3, card4]
        
        return cards
    }
    
    // MARK: TableView setup
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return numSuggested
        } else {
            return numPopular
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
            guard let cellCard = resultCards[indexPath.row] else {
                cell.card = Card(dictionary: [:])
                return cell
            }
            cell.card = cellCard
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
            guard let cellCard = popCards[indexPath.row] else {
                cell.card = Card(dictionary: [:])
                return cell
            }
            cell.card = cellCard
            return cell
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
