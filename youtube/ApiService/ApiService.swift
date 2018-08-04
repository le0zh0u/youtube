
//  ApiService.swift
//  youtube
//
//  Created by 周椿杰 on 2018/8/1.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlSring: "\(baseUrl)/home_num_likes.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlSring: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlSring: "\(baseUrl)/subscriptions.json", completion: completion) 
    }
    
    func fetchFeedForUrlString(urlSring: String, completion: @escaping ([Video]) -> ()){
        let url = URL(string: urlSring)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]]{
                    
                    DispatchQueue.global(qos: .userInitiated).async {
                        // back to the main thread
                        DispatchQueue.main.async {
                            completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                        }
                    }
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
        }).resume()
    }
}
