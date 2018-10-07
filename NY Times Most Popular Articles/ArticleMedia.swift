//
//  ArticleMedia.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

class ArticleMedia {
    
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [ArticleMediaMetadata]
    
    init(with dictionary: [String: Any]) {
        self.type = dictionary["type"] as? String ?? ""
        self.subtype = dictionary["subtype"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.copyright = dictionary["copyright"] as? String ?? ""
        self.approvedForSyndication = dictionary["approved_for_syndication"] as? Int ?? 0
        
        guard let mediaMetadata = dictionary["media-metadata"] as? [[String: Any]] else {
            self.mediaMetadata = []
            return
        }
        
        var mediaMetadataItems: [ArticleMediaMetadata] = []
        mediaMetadata.forEach { metadataElement in
            mediaMetadataItems.append(ArticleMediaMetadata(with: metadataElement))
        }
        self.mediaMetadata = mediaMetadataItems
    }
    
}
