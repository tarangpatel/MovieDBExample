//
//  UIImageView+Download.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/2/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import UIKit


extension UIImageView {
    
    static func defaultAvatarImage() -> UIImage? {
        return UIImage(named: "placeholder")
    }
    
    func downloadImageFromUrl(_ url: String, defaultImage: UIImage? = UIImageView.defaultAvatarImage()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async { [weak self]  in
                guard let strongSelf = self else { return }
                strongSelf.image = image
            }
        }).resume()
    }
    
}
