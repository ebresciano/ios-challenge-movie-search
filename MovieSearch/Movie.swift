//
//  Movie.swift
//  MovieSearch
//
//  Created by Eva Marie Bresciano on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    let title: String
    let poster: UIImage
    let description: String
    
    init(title: String, poster: UIImage = UIImage(), description: String) {
        self.title = title
        self.poster = poster
        self.description = description
    }
    
    private let kTitle = "title"
    private let kPoster = "uiimage"
    private let kDescription = "description"
    
    init?(dictionary:[String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
        let poster = dictionary[kPoster] as? UIImage,
        let description = dictionary[kDescription] as? String else {
            return nil
        }
        
        self.title = title
        self.poster = poster
        self.description = description
        
        
        
    }
    
}
