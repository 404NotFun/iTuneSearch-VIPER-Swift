//
//  AppConfig.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

enum ApiDomain: String {
    case iTuneSearch = "https://itunes.apple.com/search?"
    case iTuneLookUp = "https://itunes.apple.com/lookup?"
}

struct AppConfig {
    static var defaultHeader: [String : String] = [
        "Content-Type": "application/json"
    ]
}
