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
    private static let articlesItemCellIdentifier = "NYTMostPopularArticlesItemCell"
    private static let resultKey = "results"
    private static let segueIdentifier = "ArticleDetailsSegue"
    
    // MARK: - Outlets
    @IBOutlet private weak var placehollderLabel: UILabel! {
        didSet {
            self.placehollderLabel.isHidden = false
        }
    }
    @IBOutlet private weak var articlesListTableView: UITableView! {
        didSet {
            self.articlesListTableView.isHidden = true
        }
    }
    
    // MARK: - Variables
    private var articlesList: [ArticleItem] = []
    private var refreshControl = UIRefreshControl()
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchArticlesList()
        self.setupPullToRefreshData()
    }
    
    private func fetchArticlesList() {
        let articlesURL = NYTNetworkLayer.retriveGetArticleURLString()
        
        NYTNetworkLayer.performGet(with: articlesURL, completion: { response, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let response = response, let results = response[type(of: self).resultKey] as? [[String: Any]] else { return }
            
            self.articlesList.removeAll()
            results.forEach { resultElement in
                self.articlesList.append(ArticleItem(with: resultElement))
            }
            
            DispatchQueue.main.async {
                self.articlesListTableView.reloadData()
                self.articlesListTableView.isHidden = false
                self.placehollderLabel.isHidden = true
                self.refreshControl.endRefreshing()
            }
            
        })
    }
    
    private func setupPullToRefreshData() {
        self.refreshControl.addTarget(self, action: #selector(refreshArticleList), for: .valueChanged)
        self.articlesListTableView.refreshControl = refreshControl
    }
    
    @objc private func refreshArticleList() {
        self.fetchArticlesList()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == type(of: self).segueIdentifier) {
            
            guard let detailsViewController = segue.destination as? NYTMostPopularArticleDetailsViewController,
                let indexPath = self.articlesListTableView.indexPathForSelectedRow else {
                    return
            }
            
            detailsViewController.articleDetails = self.articlesList[indexPath.row]
        }
    }

}

// MARK: - Table View DataSource
extension NYTMostPopularArticlesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).articlesItemCellIdentifier,
                                                       for: indexPath as IndexPath) as? NYTMostPopularArticlesItemCell else {
            return NYTMostPopularArticlesItemCell()
        }
        
        cell.setArticlesItemData(article: self.articlesList[indexPath.row])
        
        return cell
    }
}

// MARK: - Table View Delegate
extension NYTMostPopularArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
