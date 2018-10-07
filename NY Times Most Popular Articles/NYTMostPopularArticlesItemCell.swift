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
    
    func setArticlesItemData(article: ArticleItem) {

        self.titleLabel.text = article.title
        self.subtitleLabel.text = article.byline
        self.publishedDateLabel.text = article.publishedDate
        
        guard let media = article.media.first,
            let thumbnailURLString = media.getThumbnailURLString() else {
                return
        }
        NYTNetworkLayer.loadImageFrom(URL: thumbnailURLString, toImageView: self.thumbnailImageView)
        
        
    }
    
}
