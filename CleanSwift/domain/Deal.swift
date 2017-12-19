//
//  Deal.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 14/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class Deal{
   
    var title: String!
    var dealId: String!
    var thumb: String!
    var releaseDate: NSInteger!
    var salePrice: String!
    var normalPrice: String!
    var steamRatingPercent: String!
    var steamRatingText: String!
    
    init(title:String!,
         thumb:String!,
         dealId: String!,
         releaseDate: NSInteger!,
         salePrice: String!,
         normalPrice: String!,
         steamRatingPercent: String!,
         steamRatingText: String!) {
        self.title = title;
        self.thumb = thumb;
        self.dealId = dealId;
        self.releaseDate = releaseDate;
        self.salePrice = salePrice;
        self.normalPrice = normalPrice;
        self.steamRatingPercent = steamRatingPercent;
        self.steamRatingText = steamRatingText;
    }
}
