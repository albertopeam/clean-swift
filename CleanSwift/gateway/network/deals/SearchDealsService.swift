//
//  SearchDealsService.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 19/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation
import Just

class SearchDealsService:SearchDeals{
    func search(term: String) throws -> Array<Deal> {
        let result:HTTPResult = Just.get("https://www.cheapshark.com/api/1.0/games?title=" + term)
        if result.ok {
            let array:Array<NSDictionary> = result.json as! Array<NSDictionary>
            return DealMapper.map(items: array)
        }else{
            throw NetworkException(code: result.statusCode, error: result.reason)
        }
    }
}
