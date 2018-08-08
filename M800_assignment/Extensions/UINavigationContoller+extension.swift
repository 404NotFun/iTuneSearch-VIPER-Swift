//
//  UINavigationContoller.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

extension UINavigationController {
    public func asyncPush(_ viewControllerToPush: UIViewController?, animated: Bool, completion: (() -> Void)? = nil) {
        Queue.main {
            if let viewControllerToPush = viewControllerToPush {
                self.pushViewController(viewControllerToPush, animated: true)
            }
        }
    }
    
    public func asyncPop(_ animated: Bool, completion: (() -> Void)? = nil) {
        Queue.main {
            self.popViewController(animated: animated)
        }
    }
}
