//
//  iTuneHelper.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import StoreKit
import MediaPlayer
import Alamofire

struct iTuneHelper {
    static let shared = iTuneHelper()
    
    func appleMusicRequestPermission(vc: UIViewController?) {
        if #available(iOS 9.3, *) {
            switch SKCloudServiceController.authorizationStatus() {
            case .authorized:
                print("The user's already authorized - we don't need to do anything more here, so we'll exit early.")
                return
            case .denied:
                print("The user has selected 'Don't Allow' in the past - so we're going to show them a different dialog to push them through to their Settings page and change their mind, and exit the function early.")
                AlertHelper.show(vc: vc!, msg: "The user has selected 'Don't Allow' in the past - so we're going to show them a different dialog to push them through to their Settings page and change their mind, and exit the function early.")
                return
            case .notDetermined:
                print("The user hasn't decided yet - so we'll break out of the switch and ask them.")
                break
            case .restricted:
                print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
                return
            }
            
            SKCloudServiceController.requestAuthorization { (status:SKCloudServiceAuthorizationStatus) in
                switch status {
                case .authorized:
                    print("All good - the user tapped 'OK', so you're clear to move forward and start playing.")
                case .denied:
                    print("The user tapped 'Don't allow'. Read on about that below...")
                case .notDetermined:
                    print("The user hasn't decided or it's not clear whether they've confirmed or denied.")
                case .restricted:
                    print("User may be restricted; for example, if the device is in Education mode, it limits external Apple Music usage. This is similar behaviour to Denied.")
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    func appleMusicCheckIfDeviceCanPlayback() {
        if #available(iOS 9.3, *) {
            let serviceController = SKCloudServiceController()
            serviceController.requestCapabilities(completionHandler: { (capability,err) in
                if let err = err {
                    print(err.localizedDescription)
                }
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    func generateParameters(term: String, limit: Int?, country: String?) -> Parameters {
        let p: Parameters = [
            "term": keywordHandler(term),
//            "limit": limit ?? 10,
            "country": country ?? "TW",
            "media": "music"
        ]
        return p
    }
    
    func generateParametersString(term: String, limit: Int?, country: String?) -> String {
        return "?term=\(keywordHandler(term))&limit=\(limit ?? 10)&country=\(country ?? "TW")&media=music"
    }
    
    private func keywordHandler(_ term: String) -> String {
        return term.lowercased().replacingOccurrences(of: " ", with: "+")
    }
}
