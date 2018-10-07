//
//  NYTMostPopularArticlesListViewController.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 06/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import UIKit

class NYTMostPopularArticlesListViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Outlets
    @IBOutlet private weak var articlesListTableView: UITableView!
    
    // MARK: - Variables
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = self.articlesListTableView.indexPathForSelectedRow else { return }
        print("Prepare for segue - \(indexPath.row)")
    }

}

// MARK: - Table View DataSource
extension NYTMostPopularArticlesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NYTMostPopularArticlesItemCell", for: indexPath as IndexPath) as? NYTMostPopularArticlesItemCell else {
            return NYTMostPopularArticlesItemCell()
        }
        
        //cell.setArticlesItemData()
        
        return cell
    }
}

// MARK: - Table View Delegate
extension NYTMostPopularArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
