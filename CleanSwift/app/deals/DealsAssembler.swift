//
//  DealsFactory.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation

class DealsAssembler {
    class func resolve() -> DealsViewController {
        let presenter:DealsPresenter = DealsPresenter()
        return DealsViewController(presenter: presenter)
    }
}
