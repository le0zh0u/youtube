//
//  Video.swift
//  youtube
//
//  Created by 周椿杰 on 2018/7/27.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        let uppercasedFirstCharacter = String(key.characters.first!).uppercased()
        
        let range = key.startIndex...key.index(key.startIndex, offsetBy: 0)
        let selectorString = key.replacingCharacters(in: range, with: uppercasedFirstCharacter)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        super.setValue(value, forKey: key)
    }
}

class Video: SafeJsonObject {
    @objc var title: String?
    @objc var uploadDate: NSDate?
    @objc var duration: NSNumber?
    @objc var channel: Channel?
    @objc var number_of_views: NSNumber?
    @objc var thumbnail_image_name: String?
    
//    @objc var num_likes: NSNumber?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" {
            //custom channel setup
            self.channel = Channel()
            let channelDictionary = value as! [String: AnyObject]
            self.channel?.setValuesForKeys(channelDictionary)
        }else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
}

class Channel: SafeJsonObject {
    
    @objc var name: String?
    @objc var profile_image_name: String?
}
