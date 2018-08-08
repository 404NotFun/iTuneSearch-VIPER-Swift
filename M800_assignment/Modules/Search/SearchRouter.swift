//
//  SearchRouter.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class SearchRouter {
    public weak var vc: UIViewController?
    
    public init(vc: UIViewController) {
        self.vc = vc
    }
}

extension SearchRouter: SearchP2R {
    func navigate2TrackVC(id: String) {
        let module = TrackViewController()
        if let nav = vc?.navigationController {
            nav.asyncPush(module, animated: true)
        }
    }
}

