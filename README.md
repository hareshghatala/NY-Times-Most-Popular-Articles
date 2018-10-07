# NY Times Most Popular Articles [POC]

This app supports iPhones and iPads with Portrait orientation running iOS 11.0
Built with Xcode Version 9.0. Written in Swift 4.0.

This test project shows a list of the New York Times most popular articles from the last 7 days.
Here user is allwed to search for the artical and user can able to view details about each article.
Also, user can read full article in Safari.
User can also able to refresh articles list using Pull to refresh.

All the code structured in MVC pattern with native network layer and not used any third party dependancy/library with unit test cases using XCTest

## API Details:
**We'll be using the most viewed section of this API.**

* **API URL:** http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key
* **Section:** We are using `all-sections` for the section path component in the URL above
* **Period:** For period we are using `7` (available period values are `1`, `7` and `30`, which represents how far back, in days, the API returns results for).
* **To generate API-Key for free:** http://developer.nytimes.com/signup

* **Example URL:** http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=sample-key
* **API Documentation:** http://developer.nytimes.com/most_popular_api_v2.json#/README

## App Details:
* Create a new project in Xcode.
* The app should open to a view controller with a table view embedded in a navigation controller.
* There should be a search bar at the top, where a user can tap into and type a search term.
* As the user types in the search bar it should dynamically populate a tableview.
* For each article returned from the response, the table view cell should have the article headline, a thumbnail image, by line and published date from that article.
* When a user taps on an article, it should push a detail view controller onto the navigation stack and present some details about that article and user can also read full artical in safari from detail page.


For any qustion or suggetions, you can create issue for it. *Enjoy The Coding !!!*
