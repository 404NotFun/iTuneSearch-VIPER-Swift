//
//  SearchPresenter.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

class SearchPresenter {
    weak var view: SearchP2V!
    var interactor: SearchP2I!
    var router: SearchP2R!
}

extension SearchPresenter: SearchV2P {
    func searchKeyword(text: String?) {
        if let text = text {
            interactor.callSearchApi(text: text)
        }
    }
    
    func push2TrackVC(id: String) {
        router.navigate2TrackVC(id: id)
    }
}


extension SearchPresenter: SearchI2P {
    func searchApiFailure(msg: String) {
        view.searchFailure(msg: msg)
    }
    
    func searchApiResult(result: ResponseResult<Track>) {
        if let list = result.results {
            view.searchFinished(result: list.flatMap({
                return TrackCellViewModel.init(id: String($0.trackId ?? 0), title: $0.trackName ?? "???", subTitle: String($0.trackPrice ?? 0))
            }))
        }else {
            view.searchFinished(result: [])
        }
    }
}
