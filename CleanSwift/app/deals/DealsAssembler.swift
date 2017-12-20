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
        let bgQueue:OperationQueue = Provider.sharedInstance.bgQueue
        let mainQueue:OperationQueue = Provider.sharedInstance.mainQueue
        let dealsInteractor:DealsInteractor = DealsInteractor(bgQueue: bgQueue, mainQueue: mainQueue, getDeals: GetDealsService())
        let searchDealsInteractor:SearchDealsInteractor = SearchDealsInteractor(bgQueue: bgQueue, mainQueue: mainQueue, searchDeals: SearchDealsService())
        let presenter:DealsPresenter = DealsPresenter(getDeals: dealsInteractor, searchDeals: searchDealsInteractor)
        return DealsViewController(presenter: presenter)
    }
}
