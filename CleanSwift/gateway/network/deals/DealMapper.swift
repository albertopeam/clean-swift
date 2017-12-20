//
//  DealMapper.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 20/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class DealMapper {
    static func map(items:Array<NSDictionary>) -> Array<Deal>{
        var deals:Array<Deal> = Array()
        for item in items{
            deals.append(map(item: item))
        }
        return deals
    }
    
    static func map(item:NSDictionary) -> Deal {
        let title:String = item.object(forKey:"title") is NSNull || item.object(forKey:"title") == nil ?
            item.object(forKey:"external") as! String: item.object(forKey:"title") as! String
        let thumb:String = item.object(forKey:"thumb") as! String
        let dealId:String = item.object(forKey:"dealID") is NSNull || item.object(forKey:"dealID") == nil ?
            item.object(forKey:"cheapestDealID") is NSNull || item.object(forKey:"cheapestDealID") == nil ? "" : item.object(forKey:"cheapestDealID") as! String :
            item.object(forKey:"dealID") as! String
        let releaseDate:NSInteger = item.object(forKey:"releaseDate") is NSNull || item.object(forKey:"releaseDate") == nil ? 0: item.object(forKey:"releaseDate") as! NSInteger
        let salePrice:String = item.object(forKey:"salePrice") is NSNull || item.object(forKey:"salePrice") == nil ?
            item.object(forKey:"cheapest") is NSNull || item.object(forKey:"cheapest") == nil ? "" : item.object(forKey:"cheapest") as! String :
            item.object(forKey:"salePrice") as! String
        let normalPrice:String = item.object(forKey:"normalPrice") is NSNull || item.object(forKey:"normalPrice") == nil ? "":item.object(forKey:"normalPrice") as! String
        let steamRatingPercent:String = item.object(forKey:"steamRatingPercent") is NSNull || item.object(forKey:"steamRatingPercent") == nil ? "":item.object(forKey:"steamRatingPercent") as! String
        let steamRatingText:String = item.object(forKey:"steamRatingText") is NSNull || item.object(forKey:"steamRatingText") == nil ? "":item.object(forKey:"steamRatingText") as! String
        return Deal(title: title,
                        thumb: thumb,
                        dealId: dealId,
                        releaseDate: releaseDate,
                        salePrice: salePrice,
                        normalPrice: normalPrice,
                        steamRatingPercent: steamRatingPercent,
                        steamRatingText: steamRatingText)
    }
}
