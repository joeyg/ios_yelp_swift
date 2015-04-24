//
//  Business.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

public class Business: NSObject {
    
    var imageUrl : String?
    var name : String?
    var ratingImageUrl : String?
    var numReviews: Int?
    var address: String?
    var categories: String?
    var distance: Float?
    
    init(dictionary: AnyObject) {
        self.imageUrl = dictionary["image_url"] as? String
        self.name = dictionary["name"] as? String
        self.ratingImageUrl = dictionary["rating_img_url"] as? String
        self.numReviews = dictionary["review_count"] as? Int
    }
    
    public static func businessesWithDictionaries(dictionaries: NSArray) -> [Business] {
        var list = [Business]()
        
        for dict in dictionaries {
            var business = Business(dictionary: dict)
        }
        
        return list
    }
}
