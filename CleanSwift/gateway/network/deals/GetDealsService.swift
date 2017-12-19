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
            var deals:Array<Deal> = Array()
            for itemD in array{
                let deal = Deal(title: itemD.object(forKey:"title") as! String, thumb: itemD.object(forKey:"thumb") as! String)
                deals.append(deal)
            }
            return deals
        }else{
            throw NetworkException(code: result.statusCode, error: result.reason)
        }
    }
    
    /*
     "internalName": "BATMANARKHAMASYLUMGAMEOFTHEYEAREDITION",
     "title": "Batman: Arkham Asylum Game of the Year Edition",
     "metacriticLink": "/game/pc/batman-arkham-asylum---game-of-the-year-edition",
     "dealID": "WmiQczaqtR1czja83xUulOngMhmt1SFdv5lVVA1GUo0%3D",
     "storeID": "6",
     "gameID": "146",
     "salePrice": "19.99",
     "normalPrice": "19.99",
     "isOnSale": "0",
     "savings": "0.000000",
     "metacriticScore": "0",
     "steamRatingText": "Overwhelmingly Positive",
     "steamRatingPercent": "96",
     "steamRatingCount": "9943",
     "steamAppID": "35140",
     "releaseDate": 1269561600,
     "lastChange": 1512463167,
     "dealRating": "0.0",
     "thumb": "http://cdn.akamai.steamstatic.com/steam/apps/35140/capsule_sm_120.jpg?t=1461102651"
     
     */
}
