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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Wallet", image: #imageLiteral(resourceName: "wallet icon"), tag: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletTable.dataSource = self
        walletTable.delegate = self
        walletTable.estimatedRowHeight = 150
        // walletTable.rowHeight = UITableViewAutomaticDimension
        
        fetchCards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Fetch Cards
    func fetchCards() -> Void {
        self.fetchedCards = Client.sharedInstance.getWalletCards()
        self.numCards = self.fetchedCards.count
        self.walletTable.reloadData()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let cell = sender as! CardTableViewCell
            let card = cell.card
            
            let destinationVC = segue.destination as! CardDetailViewController
            destinationVC.card = card
        }
    }
}
