//
//  ArticleMediaMetadata.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

private struct MediaMetadataKeys {
    
    static let mediaURLString = "url"
    static let format = "format"
    static let height = "height"
    static let width = "width"
    
}

class ArticleMediaMetadata {
    
    let mediaURLString: String
    let format: String
    let height: Int
    let width: Int
    
    init(with dictionary: [String: Any]) {
        self.mediaURLString = dictionary[MediaMetadataKeys.mediaURLString] as? String ?? ""
        self.format = dictionary[MediaMetadataKeys.format] as? String ?? ""
        self.height = dictionary[MediaMetadataKeys.height] as? Int ?? 0
        self.width = dictionary[MediaMetadataKeys.width] as? Int ?? 0
    }
}
