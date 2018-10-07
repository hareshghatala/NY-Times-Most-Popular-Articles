//
//  ArticleMediaTests.swift
//  NY Times Most Popular ArticlesTests
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import XCTest

@testable import NY_Times_Most_Popular_Articles

class ArticleMediaTests: XCTestCase {

    func testEmptyInit() {
        let media = ArticleMedia(with: [:])
        
        XCTAssertNotNil(media)
        XCTAssertEqual(media.type, "")
        XCTAssertEqual(media.subtype, "")
        XCTAssertEqual(media.caption, "")
        XCTAssertEqual(media.copyright, "")
        XCTAssertEqual(media.approvedForSyndication, 0)
    }
    
    func testInitWithoutMetadata() {
        let mediaData: [String: Any] = ["type": "image",
                                        "subtype": "photo",
                                        "caption": "Senator Jeff Flake, Republican of Arizona",
                                        "copyright": "Jeffery A. Salter/The New York Times",
                                        "approved_for_syndication": 1]
        
        let media = ArticleMedia(with: mediaData)
        
        XCTAssertNotNil(media)
        XCTAssertEqual(media.type, "image")
        XCTAssertEqual(media.subtype, "photo")
        XCTAssertEqual(media.caption, "Senator Jeff Flake, Republican of Arizona")
        XCTAssertEqual(media.copyright, "Jeffery A. Salter/The New York Times")
        XCTAssertEqual(media.approvedForSyndication, 1)
        XCTAssertEqual(media.mediaMetadata.count, 0)
    }
    
    func testInitWithMetadata() {
        let mediaData: [String: Any] = ["type": "image",
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
                                            ]]]
        
        let media = ArticleMedia(with: mediaData)
        
        XCTAssertNotNil(media)
        XCTAssertEqual(media.type, "image")
        XCTAssertEqual(media.subtype, "photo")
        XCTAssertEqual(media.caption, "")
        XCTAssertEqual(media.copyright, "")
        XCTAssertEqual(media.approvedForSyndication, 0)
        XCTAssertEqual(media.mediaMetadata.count, 2)
    }
    
    func testGetThumbnailURLString() {
        let mediaData: [String: Any] = ["type": "image",
                                        "media-metadata": [
                                            ["url": "https://static01.nyt.com/images/fred-image-square320.jpg",
                                             "format": "square320",
                                             "height": 320,
                                             "width": 320
                                            ]]]
        
         let media = ArticleMedia(with: mediaData)
        
        XCTAssertEqual(media.getThumbnailURLString(), "https://static01.nyt.com/images/fred-image-square320.jpg")
    }
    
    func testGetThumbnailURLStringWithInvalidData() {
        let mediaData: [String: Any] = ["type": "image",
                                        "media-metadata": [
                                            ["url": "https://static01.nyt.com/images/fred-image-thumbStandard.jpg",
                                             "format": "Standard Thumbnail",
                                             "height": 75,
                                             "width": 75
                                            ]]]
        
        let media = ArticleMedia(with: mediaData)
        XCTAssertNil(media.getThumbnailURLString())
    }
    
    func testGetImageURLString() {
        let mediaData: [String: Any] = ["type": "image",
                                        "media-metadata": [
                                            ["url": "https://static01.nyt.com/images/fred-image-large.jpg",
                                             "format": "Large",
                                             "height": 263,
                                             "width": 395
                                            ]]]
        
        let media = ArticleMedia(with: mediaData)
        
        XCTAssertEqual(media.getImageURLString(), "https://static01.nyt.com/images/fred-image-large.jpg")
    }
    
    func testGetImageURLStringWithInvalidData() {
        let mediaData: [String: Any] = ["type": "image",
                                        "media-metadata": [
                                            ["url": "https://static01.nyt.com/images/fred-image-thumbStandard.jpg",
                                             "format": "Standard Thumbnail",
                                             "height": 75,
                                             "width": 75
                                            ]]]
        
        let media = ArticleMedia(with: mediaData)
        XCTAssertNil(media.getImageURLString())
    }
    
}
