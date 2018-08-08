//
//  SearchViewController.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var input: SearchV2P!
    
    override func loadView() {
        super.loadView()
        let config = SearchConfigurator()
        config.configureModuleForViewInput(viewInput: self)
        
        self.view.backgroundColor = AppColor.themeBlue
        
        if let navController = self.navigationController {
            navController.isNavigationBarHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: SearchP2V {
    func searchFailure(msg: String) {
        
    }
    
    func searchFinished(result: ResponseResult<Track>) {
        
    }
}
