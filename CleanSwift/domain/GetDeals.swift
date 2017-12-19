//
//  GetDeals.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 18/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

protocol GetDeals {
    func get() throws -> Array<Deal>
}
