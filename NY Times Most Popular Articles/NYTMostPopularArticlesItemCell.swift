//
//  NYTMostPopularArticlesItemCell.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import UIKit

class NYTMostPopularArticlesItemCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var thumbnailImageView: UIImageView! {
        didSet {
            self.thumbnailImageView.layer.cornerRadius = self.thumbnailImageView.frame.size.height / 2
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var publishedDateLabel: UILabel!
    
    // MARK: - Public functions
    
    func setArticlesItemData() {
        self.loadImageWithURL(urlString: "")
        self.titleLabel.text = ""
        self.subtitleLabel.text = ""
        self.publishedDateLabel.text = ""
    }
    
    func loadImageWithURL(urlString: String) {
        self.thumbnailImageView.image = UIImage()
    }

}
