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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var steamRatingPercentLabel: UILabel!
    @IBOutlet weak var steamRatingTextLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var normalPriceLabel: UILabel!
    
    func setup(deal:Deal) -> Void {
        title.text = deal.title
        if deal.releaseDate == 0 {
            dateLabel.text = "-"
        }else{
            let date = Date(timeIntervalSince1970: Double(deal.releaseDate))
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "dd/MM/yyyy"
            dateLabel.text = dateFormatter.string(from: date)
        }
        steamRatingTextLabel.text = deal.steamRatingText
        steamRatingPercentLabel.text = "Score " + deal.steamRatingPercent
        salePriceLabel.text = "Sale price " + deal.salePrice + "€"
        normalPriceLabel.text = "Normal price " + deal.normalPrice + "€"
        let url = URL(string: deal.thumb)!
        image.kf.setImage(with: url, placeholder:UIImage(named: "placeholder"))
    }
}
