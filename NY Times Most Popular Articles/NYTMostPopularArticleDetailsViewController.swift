//
//  NYTMostPopularArticleDetailsViewController.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import UIKit

class NYTMostPopularArticleDetailsViewController: UIViewController {

    // MARK: - Constants
    private static let titleText = "Article Details"
    
    // MARK: - Outlets
    
    // MARK: - Variables
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = type(of: self).titleText
    }

}
