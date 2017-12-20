//
//  SearchDeals.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 20/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

protocol SearchDeals {
    func search(term:String) throws -> Array<Deal>
}
