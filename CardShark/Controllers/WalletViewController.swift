//
//  WalletViewController.swift
//  CardShark
//
//  Created by Angela Yu on 6/19/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var walletTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletTable.dataSource = self
        walletTable.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletCell", for: indexPath) as! WalletTableViewCell
        cell.cardLabel.text = "Chase Sapphire Reserve, row \(indexPath.row)"
        cell.cardImageView.image = #imageLiteral(resourceName: "sapphire")
        return cell
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
