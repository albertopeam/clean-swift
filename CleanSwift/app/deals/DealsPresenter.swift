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
        self.view?.loading(visibility: true)
        getDeals.run(completion: { (response: Array<Deal>) -> (Void) in
            self.view?.loading(visibility: false)
            self.view?.onLoadedDeals(deals: response)
        }) { (exception: Exception) -> (Void) in
            self.view?.loading(visibility: false)
            self.view?.onLoadedDealsException(exception: exception)
        }
    }
    
    func searchDeals(searchTerm:String) -> Void{
        self.view?.loading(visibility: true)
        searchDeals.run(searchTerm: searchTerm, completion: { (response: Array<Deal>) -> (Void) in
            self.view?.loading(visibility: false)
            self.view?.onLoadedDeals(deals: response)
        }) { (exception: Exception) -> (Void) in
            self.view?.loading(visibility: false)
            self.view?.onLoadedDealsException(exception: exception)
        }
    }
    
}
