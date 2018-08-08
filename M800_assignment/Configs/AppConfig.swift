//
//  AppConfig.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

enum ApiDomain: String {
    case iTuneSearch = "https://itunes.apple.com/search?"
    case iTuneLookUp = "https://itunes.apple.com/lookup?"
}

struct AppConfig {
    static var defaultHeader: [String : String] = [
        "Content-Type": "application/json"
    ]
}

struct AppColor {
    public static let themeBlue = UIColor(hexString: "64C0E8")
    public static let mainOrange = UIColor(hexString: "FFA65C")
    public static let backgroundOrange = UIColor(hexString: "FFB77A")
    public static let lightBackgroundColor = UIColor(hexString: "FFF0E2")
    public static let textColor = UIColor(hexString: "979797")
    public static let darkTextColor = UIColor(hexString: "956135")
    public static let countdownShadowLayerColor = UIColor(hexString: "F6A623")
    public static let countdownLayerColor = UIColor(hexString: "FFD0A9")
}
