//
//  SearchDealsInteractor.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 20/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class SearchDealsInteractor{
    
    fileprivate let bgQueue:OperationQueue
    fileprivate let mainQueue:OperationQueue
    fileprivate let searchDeals:SearchDeals
    
    init(bgQueue:OperationQueue, mainQueue:OperationQueue, searchDeals:SearchDeals) {
        self.bgQueue = bgQueue
        self.mainQueue = mainQueue
        self.searchDeals = searchDeals
    }
    
    func run(searchTerm:String, completion: @escaping ((Array<Deal>)->(Void)), exception: @escaping (Exception)->(Void)) -> Void {
        self.bgQueue.addOperation {
            do{
                if(searchTerm == ""){
                    completion(Array())
                }else{
                    let deals:Array<Deal> = try self.searchDeals.search(term: searchTerm)
                    self.mainQueue.addOperation {
                        completion(deals)
                    }
                }
            } catch let error as NetworkException {
                self.mainQueue.addOperation({
                    exception(error)
                })
            } catch {
                self.mainQueue.addOperation({
                    exception(error as! Exception)
                })
            }
        }
    }
}
