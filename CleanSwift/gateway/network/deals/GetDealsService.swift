//
//  GetDeals.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 14/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation
import Just

class GetDealsService:GetDeals {
    func get() throws -> Array<Deal>{
        let result:HTTPResult = Just.get("https://www.cheapshark.com/api/1.0/deals?desc=1&pageSize=25")
        if result.ok {
            let array:Array<NSDictionary> = result.json as! Array<NSDictionary>
            return DealMapper.map(items: array)
        }else{
            throw NetworkException(code: result.statusCode, error: result.reason)
        }
    }
}
