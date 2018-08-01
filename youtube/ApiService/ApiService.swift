//
//  ApiService.swift
//  youtube
//
//  Created by 周椿杰 on 2018/8/1.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    static let sharedInstance = ApiService()
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                var videos = [Video]()
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channel = Channel()
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    // back to the main thread
                    DispatchQueue.main.async {
                        completion(videos)
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
        }).resume()
    }
}
