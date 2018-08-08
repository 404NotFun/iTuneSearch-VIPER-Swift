//
//  Queue.swift
//  M800_assignment
//
//  Created by Jason Tsai on 2018/8/8.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

final public class Queue {
    
    fileprivate static let serialQueue = DispatchQueue(label: "io.tmbase.queue", attributes: [])
    
    public class func mainQueue() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public class func qosQueue() -> DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
    }
    
    public class func main(_ block: @escaping () -> Void) {
        Queue.mainQueue().async {
            block()
        }
    }
    
    public class func qos(_ block: @escaping () -> Void) {
        Queue.qosQueue().async {
            block()
        }
    }
    
    
    public class func delayInMainQueue(for time: TimeInterval) {
        let delay = DispatchTime.now() + time
        
        Queue.mainQueue().asyncAfter(deadline: delay) {
            
        }
    }
    
    //    @discardableResult
    //    public class func delayInMainQueue(for time: TimeInterval) -> Promise<Void> {
    //        let delay = DispatchTime.now() + time
    //        let (promise, fulfill) = Promise<Void>.pending()
    //
    //        Queue.mainQueue().asyncAfter(deadline: delay) {
    //            fulfill
    //        }
    //
    //        return promise
    //    }
    
    public class func delayInMainQueueFor(_ time: Double, block: @escaping () -> Void) {
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * time)) / Double(NSEC_PER_SEC)
        Queue.mainQueue().asyncAfter(deadline: delay, execute: { () -> Void in
            block()
        })
    }
    
    public class func delayInQosQueue(_ time: Double, block: @escaping () -> Void) {
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * time)) / Double(NSEC_PER_SEC)
        Queue.qosQueue().asyncAfter(deadline: delay, execute: { () -> Void in
            block()
        })
    }
    
    public class func backgroundSerialQueue(_ block: () -> Void) {
        serialQueue.sync {
            block()
        }
    }
    
    public class func delayInBackgroundSerialQueue(_ time: Double, block: @escaping () -> Void) {
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * time)) / Double(NSEC_PER_SEC)
        serialQueue.asyncAfter(deadline: delay, execute: { () -> Void in
            block()
        })
    }
}
