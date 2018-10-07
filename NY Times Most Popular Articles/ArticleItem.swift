//
//  ArticleItem.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

class ArticleItem {
    
    let fullArticleURL: String
    let adxKeywords: String
    let column: String
    let section: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let publishedDate: String
    let source: String
    let articleId: String
    let assetId: String
    let views: Int
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [ArticleMedia]
    
    init(with dictionary: [String: Any]) {
        self.fullArticleURL = dictionary["url"] as? String ?? ""
        self.adxKeywords = dictionary["adx_keywords"] as? String ?? ""
        self.column = dictionary["column"] as? String ?? ""
        self.section = dictionary["section"] as? String ?? ""
        self.byline = dictionary["byline"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.abstract = dictionary["abstract"] as? String ?? ""
        self.publishedDate = dictionary["published_date"] as? String ?? ""
        self.source = dictionary["source"] as? String ?? ""
        self.articleId = dictionary["id"] as? String ?? ""
        self.assetId = dictionary["asset_id"] as? String ?? ""
        self.views = dictionary["views"] as? Int ?? 0
        self.desFacet = dictionary["des_facet"] as? [String] ?? []
        self.orgFacet = dictionary["org_facet"] as? [String] ?? []
        self.perFacet = dictionary["per_facet"] as? [String] ?? []
        self.geoFacet = dictionary["geo_facet"] as? [String] ?? []
        
        guard let media = dictionary["media"] as? [[String: Any]] else {
            self.media = []
            return
        }
        
        var mediaItems: [ArticleMedia] = []
        media.forEach { mediaElement in
            mediaItems.append(ArticleMedia(with: mediaElement))
        }
        self.media = mediaItems
    }
    
}

