//
//  ArticleMediaMetadataTests.swift
//  NY Times Most Popular ArticlesTests
//
//  Created by Haresh Ghatala on 08/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import XCTest

@testable import NY_Times_Most_Popular_Articles

class ArticleMediaMetadataTests: XCTestCase {

    func testEmptyInit() {
        let mediaMetadata = ArticleMediaMetadata(with: [:])
        
        XCTAssertNotNil(mediaMetadata)
        XCTAssertEqual(mediaMetadata.mediaURLString, "")
        XCTAssertEqual(mediaMetadata.format, "")
        XCTAssertEqual(mediaMetadata.height, 0)
        XCTAssertEqual(mediaMetadata.width, 0)
    }
    
    func testInit() {
        let metadata: [String: Any] = ["url": "https://static01.nyt.com/images/fred-image-square320.jpg",
                                       "format": "square320",
                                       "height": 320,
                                       "width": 320]
        
        let mediaMetadata = ArticleMediaMetadata(with: metadata)
        
        XCTAssertNotNil(mediaMetadata)
        XCTAssertEqual(mediaMetadata.mediaURLString, "https://static01.nyt.com/images/fred-image-square320.jpg")
        XCTAssertEqual(mediaMetadata.format, "square320")
        XCTAssertEqual(mediaMetadata.height, 320)
        XCTAssertEqual(mediaMetadata.width, 320)
    }
}
