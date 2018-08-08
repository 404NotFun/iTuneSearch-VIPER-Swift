//
//  SearchInteractor.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class SearchInteractor {
    var apiManager = iTuneApiManager()
    var vc: UIViewController!
    weak var output: SearchI2P!
}

extension SearchInteractor: SearchP2I {
    func callSearchApi(text: String) {
        apiManager.search(term: text, limit: 10, country: "TW", completion: { resp in
            self.output.searchApiResult(result: resp)
        }, failure: { msg in
            
        })
    }
}
