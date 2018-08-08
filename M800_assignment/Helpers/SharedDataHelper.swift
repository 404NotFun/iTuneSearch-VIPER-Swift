//
//  SharedDataHelper.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

struct SharedDataHelper {
    static private var sharedData = NSMutableDictionary()
    
    static func set(key: String, value: Any?) {
        sharedData.setValue(value, forKey: key)
    }
    
    static func get(key: String) -> Any? {
        return sharedData.value(forKey: key)
    }
}
