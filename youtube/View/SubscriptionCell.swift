//
//  SubscriptionCell.swift
//  youtube
//
//  Created by 周椿杰 on 2018/8/4.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    
    override func fetchVideos(){
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos:[Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
