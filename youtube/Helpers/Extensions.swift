//
//  File.swift
//  youtube
//
//  Created by 周椿杰 on 2018/7/26.
//  Copyright © 2018年 周椿杰. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                // back to the main thread
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
            
            /*let queue = DispatchQueue(label: "com.leozhou.youtube.videoCell")
             queue.async {
             self.image = UIImage(data: data!)
             }*/
            }.resume()
    }
}
