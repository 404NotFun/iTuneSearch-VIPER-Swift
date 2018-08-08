//
//  TrackViewController.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import StoreKit
import MediaPlayer

class TrackViewController: UIViewController {
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.themeBlue
        iTuneHelper.shared.appleMusicCheckIfDeviceCanPlayback()
        iTuneHelper.shared.appleMusicRequestPermission(vc: self)
        if #available(iOS 9.3, *) {
            if let trackId: String = SharedDataHelper.get(key: "TrackId") as? String {
                appleMusicPlayTrackId(ids: [trackId])
            }
        } else {
            AlertHelper.show(vc: self, msg: "此裝置的作業系統無法使用")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @available(iOS 9.3, *)
    func appleMusicPlayTrackId(ids:[String]) {
        let applicationMusicPlayer = MPMusicPlayerController.applicationMusicPlayer
        applicationMusicPlayer.setQueue(with: ids)
        applicationMusicPlayer.play()
    }
    
    @available(iOS 9.3, *)
    func appleMusicFetchStorefrontRegion() {
        let serviceController = SKCloudServiceController()
        serviceController.requestStorefrontIdentifier(completionHandler: { (storefrontId, err) in
            guard err == nil else {
                print("An error occured. Handle it here.")
                return
            }
            guard let storefrontId = storefrontId, storefrontId.count >= 6 else {
                print("Handle the error - the callback didn't contain a valid storefrontID.")
                return
            }
            print("Success! The user's storefront ID is: \(storefrontId.substring(location: 0, length: 5) ?? "")")
        })
    }
}
