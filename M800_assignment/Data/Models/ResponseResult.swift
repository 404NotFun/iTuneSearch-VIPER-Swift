//
//  ResponseResult.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseResult<Y: Mappable>: Mappable {
    typealias T = [Y]?
    
    var resultCount: Int!
    var results: T
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        resultCount    <- map["resultCount"]
        results        <- map["results"]
    }
}
