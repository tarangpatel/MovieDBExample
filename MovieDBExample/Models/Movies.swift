//
//  Movies.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movies: Mappable {
    
    var page: Int?
    var results: [Movie]?
    var dates:[String: AnyObject]?
    var total_pages: Int?
    var total_results: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        page            <- map["page"]
        results         <- map["results"]
        dates           <- map["dates"]
        total_pages     <- map["total_pages"]
        total_results   <- map["total_results"]
        
    }

}
