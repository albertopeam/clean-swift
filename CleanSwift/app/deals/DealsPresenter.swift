//
//  DealsPresenter.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class DealsPresenter {
    
    fileprivate let getDeals:DealsInteractor
    weak var view:DealsViewController?
    
    init(getDeals:DealsInteractor) {
        self.getDeals = getDeals
    }
    
    func obtainDeals() -> Void {
        getDeals.run(completion: { (response: Array<Deal>) -> (Void) in
            self.view?.onLoadedDeals(deals: response)
        }) { (exception: Exception) -> (Void) in
            self.view?.onLoadedDealsException(exception: exception)
        }
    }
    
}
