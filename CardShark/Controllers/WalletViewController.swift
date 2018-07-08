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
    var numCards = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletTable.dataSource = self
        walletTable.delegate = self
        walletTable.rowHeight = UITableViewAutomaticDimension
        walletTable.estimatedRowHeight = 124
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numCards = 5 // populate this with API call of user's cards
        return numCards + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row < numCards) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
            cell.cardLabel.text = "Chase Sapphire Reserve, row \(indexPath.row)"
            cell.cardImageView.image = #imageLiteral(resourceName: "sapphire")
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
