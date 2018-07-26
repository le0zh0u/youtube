//
//  MenuBar.swift
//  youtube
//
//  Created by 周椿杰 on 2018/7/26.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

class MenuBar : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented" )
    }
}
