//
//  Error.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 19/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class Exception: Error {
    fileprivate var code:Int?
    fileprivate var error:String?
    
    init(code: Int?, error:String?) {
        self.code = code
        self.error = error
    }
    
    func localizedDescription() -> String! {
        var desc = ""
        desc.append(code != nil ? String(describing: code!):"")
        desc.append(code != nil ? String(", "):"")
        desc.append(error != nil ? String(describing: error!):"")
        desc.append(desc == "" ? "Internal error":"")
        return desc
    }
}
