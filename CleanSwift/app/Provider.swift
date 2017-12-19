//
//  Provider.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 18/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class Provider {
    
    static let sharedInstance = Provider()
    let bgQueue:OperationQueue
    let mainQueue:OperationQueue
    
    fileprivate init() {
        bgQueue = OperationQueue()
        mainQueue =  OperationQueue.main
        
        //probar a instanciar...
        //https://www.natashatherobot.com/ios-testing-view-controllers-swift/
    }
}
