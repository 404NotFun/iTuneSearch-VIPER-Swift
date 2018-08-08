//
//  SearchConfigurator.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

// Input
protocol SearchV2P {
    func push2TrackVC(id: String)
}

protocol SearchP2I {
    func callSearchApi(text: String)
}
protocol SearchP2R {
    func navigate2TrackVC(id: String)
}
// Output
protocol SearchI2P: class {
    func searchApiResult(result: ResponseResult<Track>)
    func searchApiFailure(msg: String)
}
protocol SearchP2V: class {
    func searchFinished(result: ResponseResult<Track>)
    func searchFailure(msg: String)
}

class SearchConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? SearchViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: SearchViewController) {
        let presenter = SearchPresenter()
        let router = SearchRouter(vc: viewController)
        let interactor = SearchInteractor()
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.vc = viewController
        interactor.output = presenter
        viewController.input = presenter
    }
}
