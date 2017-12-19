//
//  DealsInteractor.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class DealsInteractor {
    
    fileprivate let getDeals:GetDeals
    fileprivate let bgQueue:OperationQueue
    fileprivate let mainQueue:OperationQueue
    
    init(getDeals:GetDeals, bgQueue:OperationQueue, mainQueue:OperationQueue) {
        self.getDeals = getDeals
        self.bgQueue = bgQueue
        self.mainQueue = mainQueue
    }
    
    func run(completion: @escaping (Array<Deal>) -> (Void), exception: @escaping(Exception) -> (Void)) -> Void {
        self.bgQueue.addOperation {
            var deals:Array<Deal>
            do {
                deals = try self.getDeals.get();
                self.mainQueue.addOperation({
                    completion(deals)
                })
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
