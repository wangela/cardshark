//
//  CardSearchViewController.swift
//  CardShark
//
//  Created by Angela Yu on 6/20/18.
//  Copyright © 2018 Angela Yu. All rights reserved.
//

import UIKit

class CardSearchViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var resultsTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    let sectionTitles = ["Matching Cards", "Popular Cards"]
    var popCards: [Card?] = [Card]()
    var resultCards: [Card?] = [Card]()
    var numPopular = 0
    var numSuggested = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        resultsTableView.estimatedRowHeight = 124
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type a credit card name"
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        popCards = fetchPopularCards()
        numPopular = popCards.count
        resultsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Cards fetching
    func fetchPopularCards() -> [Card] {
        let cards = Client.sharedInstance.getPopularCards()
        
        return cards
    }
    
    // MARK: - SearchController setup
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isSearching() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // MARK: - TableView setup
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching() {
            return sectionTitles.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearching() {
            return sectionTitles[section]
        } else {
            return sectionTitles[1]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            if section == 0 {
                return numSuggested
            } else {
                return numPopular
            }
        } else {
            return numPopular
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching() {
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

extension CardSearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating delegate
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            if let cards = Client.sharedInstance.search(term: searchText) {
                self.resultCards = cards
                self.numSuggested = resultCards.count
                self.resultsTableView.reloadData()
            }
        } else {
            self.resultCards = []
            self.numSuggested = resultCards.count
            self.resultsTableView.reloadData()
        }
    }
    
}
