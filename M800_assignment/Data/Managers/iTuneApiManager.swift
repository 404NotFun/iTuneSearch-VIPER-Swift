//
//  iTuneApiManager.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

struct iTuneApiManager: HttpRequest {
    func search(term: String, limit: Int, country: String, completion: @escaping(ResponseResult<Track>)->(), failure: @escaping(String?)->()) {
        getArray(domain: .iTuneSearch, url: "", parameters: iTuneHelper.shared.generateParameters(term: term, limit: limit, country: country), ofType: Track.self, completion: completion, failure: failure)
    }
}
