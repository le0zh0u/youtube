//
//  Video.swift
//  youtube
//
//  Created by 周椿杰 on 2018/7/27.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
    
}

class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
}
