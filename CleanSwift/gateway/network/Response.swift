//
//  APIResponse.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 14/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class Response {
    var data: Any?
    var error: Error?
    
    init(data: Any?, error: Error?) {
        self.data = data
        self.error = error;
    }
}
