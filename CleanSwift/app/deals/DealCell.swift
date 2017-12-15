//
//  DealCell.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DealCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func setup(deal:Deal) -> Void {
        title.text = deal.title
        let url = URL(string: deal.thumb)!
        image.kf.setImage(with: url, placeholder:UIImage(named: "placeholder"))
    }
}
