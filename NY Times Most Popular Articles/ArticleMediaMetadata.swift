//
//  ArticleMediaMetadata.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

class ArticleMediaMetadata {
    
    let mediaURLString: String
    let format: String
    let height: Int
    let width: Int
    
    init(with dictionary: [String: Any]) {
        self.mediaURLString = dictionary["url"] as? String ?? ""
        self.format = dictionary["format"] as? String ?? ""
        self.height = dictionary["height"] as? Int ?? 0
        self.width = dictionary["width"] as? Int ?? 0
    }
}
