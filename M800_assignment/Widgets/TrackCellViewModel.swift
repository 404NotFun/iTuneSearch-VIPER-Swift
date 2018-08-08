//
//  TrackViewModel.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public struct TrackCellViewModel {
    var id: String!
    var title: String!
    var subTitle: String?
    
    init(id: String, title: String, subTitle: String) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
    }
}
