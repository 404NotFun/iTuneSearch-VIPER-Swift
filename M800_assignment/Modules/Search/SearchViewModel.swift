//
//  SearchViewModel.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

final public class SearchViewModel {
    var searchText: String?
    var list: [TrackCellViewModel]
    
    required public init (searchText: String?, list: [TrackCellViewModel]) {
        self.searchText = searchText
        self.list = list
    }
}
