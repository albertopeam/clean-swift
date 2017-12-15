//
//  NetworkError.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 14/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class NetworkError:Error{
    var code:Int?
    var error:String?
    
    init(code: Int?, error:String?) {
        self.code = code
        self.error = error
    }
}
