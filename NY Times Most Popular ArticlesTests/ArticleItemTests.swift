//
//  ArticleItemTests.swift
//  NY Times Most Popular ArticlesTests
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import XCTest

@testable import NY_Times_Most_Popular_Articles

class ArticleItemTests: XCTestCase {

    func testEmptyInit() {
        let item = ArticleItem(with: [:])
        
        XCTAssertNotNil(item)
        XCTAssertEqual(item.title, "")
        XCTAssertEqual(item.byline, "")
        XCTAssertEqual(item.publishedDate, "")
        XCTAssertEqual(item.fullArticleURL, "")
        XCTAssertEqual(item.views, 0)
        XCTAssertEqual(item.desFacet, [])
    }
    
    func testInitWithoutMedia() {
    
        let itemData: [String: Any] = ["url": "https://www.nytimes.com",
                                       "section": "U.S.",
                                       "byline": "By DAVID BARSTOW and RUSS BUETTNER",
                                       "type": "Interactive",
                                       "title": "Trump Engaged in Suspect Tax Schemes",
                                       "abstract": "The president has long sold himself as a self-made billionaire",
                                       "published_date": "2018-10-02",
                                       "source": "The New York Times",
                                       "views": 126,
                                       "per_facet": ["TRUMP, DONALD J", "TRUMP, FRED C"]]
        
        let item = ArticleItem(with: itemData)
        
        XCTAssertNotNil(item)
        XCTAssertEqual(item.fullArticleURL, "https://www.nytimes.com")
        XCTAssertEqual(item.section, "U.S.")
        XCTAssertEqual(item.byline, "By DAVID BARSTOW and RUSS BUETTNER")
        XCTAssertEqual(item.type, "Interactive")
        XCTAssertEqual(item.title, "Trump Engaged in Suspect Tax Schemes")
        XCTAssertEqual(item.abstract, "The president has long sold himself as a self-made billionaire")
        XCTAssertEqual(item.publishedDate, "2018-10-02")
        XCTAssertEqual(item.source, "The New York Times")
        XCTAssertEqual(item.views, 126)
        XCTAssertEqual(item.perFacet, ["TRUMP, DONALD J", "TRUMP, FRED C"])
    }
    
    func testInitWithMedia() {
        
        let itemData: [String: Any] = ["url": "https://www.nytimes.com",
                                       "byline": "By DAVID BARSTOW and RUSS BUETTNER",
                                       "title": "Trump Engaged in Suspect Tax Schemes",
                                       "published_date": "2018-10-02",
                                       "media": [["type": "image",
                                            "subtype": "photo",
                                            "media-metadata": [
                                                ["url": "https://static01.nyt.com/images/fred-image-square320.jpg",
                                                "format": "square320",
                                                "height": 320,
                                                "width": 320
                                                ],
                                                ["url": "https://static01.nyt.com/images/fred-image-thumbStandard.jpg",
                                                "format": "Standard Thumbnail",
                                                "height": 75,
                                                "width": 75
                                                ]]]]]
        
        let item = ArticleItem(with: itemData)
        
        XCTAssertNotNil(item)
        XCTAssertEqual(item.fullArticleURL, "https://www.nytimes.com")
        XCTAssertEqual(item.byline, "By DAVID BARSTOW and RUSS BUETTNER")
        XCTAssertEqual(item.title, "Trump Engaged in Suspect Tax Schemes")
        XCTAssertEqual(item.publishedDate, "2018-10-02")
        XCTAssertEqual(item.media.count, 1)
    }
    
}
