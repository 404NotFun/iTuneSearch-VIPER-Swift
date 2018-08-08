//
//  HttpRequest.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol HttpRequest {
    
}

extension HttpRequest {
    // 取得連線狀態
    func isConnected() -> Bool {
        return (Reachability()?.isReachable)!
    }
    
    func doCheck(connected: @escaping()->(), disconnected: @escaping()->()) {
        let reachability = Reachability()!
        URLCache.shared.removeAllCachedResponses()
        if (reachability.isReachable) {
            connected()
        }else {
            disconnected()
        }
    }
    
    // 連線狀態下促發的功能
    func connectedNetworking(action: @escaping()->()) {
        let reachability = Reachability()!
        URLCache.shared.removeAllCachedResponses()
        if (reachability.isReachable) {
            action()
        }else {
            //self.alert()
        }
    }
    // 離線狀態下促發的功能
    func disconnectedNetworking(action: @escaping()->()) {
        let reachability = Reachability()!
        if !(reachability.isReachable) {
            //self.alert()
            action()
        }
    }
    
    func getArray<T: Mappable>(domain: ApiDomain, url: String, parameters: Parameters?, ofType: T.Type, completion: @escaping(ResponseResult<T>)->(), failure: @escaping(String?)->()) {
        connectedNetworking {
            Alamofire.request(domain.rawValue+url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: AppConfig.defaultHeader).responseObject(completionHandler: { (response: DataResponse<ResponseResult<T>>) in
                if let responseJSON = response.result.value {
                    completion(responseJSON)
                }else {
                    failure(response.debugDescription)
                }
            })
        }
    }
}
