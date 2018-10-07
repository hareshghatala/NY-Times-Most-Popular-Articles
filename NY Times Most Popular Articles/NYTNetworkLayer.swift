//
//  NYTNetworkLayer.swift
//  NY Times Most Popular Articles
//
//  Created by Haresh Ghatala on 07/10/18.
//  Copyright © 2018 Haresh Ghatala. All rights reserved.
//

import Foundation
import UIKit

class NYTNetworkLayer {
    
    private static let baseArticleURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
    private static let articleURLQuery = ".json?api-key="
    private static let section = "all-sections"
    private static let period = "7"
    private static let apiKey = "c716264b10454d718eabda3b17124e15"
    
    class func performGet(with urlString: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
        guard let getURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: getURL, completionHandler: { responseData, _, error in
            if error != nil {
                completion(nil, error)
                return
            }
            
            guard let data = responseData else { return }
            do {
                guard let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(nil, error)
                    return
                }
                completion(response, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }).resume()
    }
    
    class func loadImageFrom(URL urlString: String, toImageView: UIImageView, placeholderImege: UIImage? = nil) {
        toImageView.image = placeholderImege
        guard let imageURL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { data, _, _ in
            
            guard let data = data else { return }
            toImageView.image = UIImage(data: data)
            
        }).resume()
    }
    
    class func retriveGetArticleURLString() -> String {
        return "\(self.baseArticleURL)\(self.section)/\(self.period)\(self.articleURLQuery)\(self.apiKey)"
    }
    
}
