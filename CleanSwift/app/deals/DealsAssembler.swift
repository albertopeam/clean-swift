//
//  DealsFactory.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class DealsAssembler {
    class func resolve() -> DealsViewController {
        let getDeals:GetDeals = GetDealsService();
        let bgQueue:OperationQueue = Provider.sharedInstance.bgQueue
        let mainQueue:OperationQueue = Provider.sharedInstance.mainQueue
        let dealsInteractor:DealsInteractor = DealsInteractor(getDeals: getDeals, bgQueue: bgQueue, mainQueue: mainQueue)
        let presenter:DealsPresenter = DealsPresenter(getDeals: dealsInteractor)
        return DealsViewController(presenter: presenter)
    }
}
