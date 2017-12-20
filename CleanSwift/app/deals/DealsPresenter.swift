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
    fileprivate let searchDeals:SearchDealsInteractor
    weak var view:DealsViewController?
    
    init(getDeals:DealsInteractor, searchDeals:SearchDealsInteractor) {
        self.getDeals = getDeals
        self.searchDeals = searchDeals
    }
    
    func obtainDeals() -> Void {
        getDeals.run(completion: { (response: Array<Deal>) -> (Void) in
            self.view?.onLoadedDeals(deals: response)
        }) { (exception: Exception) -> (Void) in
            self.view?.onLoadedDealsException(exception: exception)
        }
    }
    
    func searchDeals(searchTerm:String) -> Void{
        searchDeals.run(searchTerm: searchTerm, completion: { (response: Array<Deal>) -> (Void) in
            self.view?.onLoadedDeals(deals: response)
        }) { (exception: Exception) -> (Void) in
            self.view?.onLoadedDealsException(exception: exception)
        }
    }
    
}
