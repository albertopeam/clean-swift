//
//  DealsView.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation
import UIKit

class DealsView:UIView, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var deals:Array<Deal> = Array()
    
    func reloadData(deals:Array<Deal>) -> Void {
        self.deals = deals
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return deals.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "deal_cell",
                                                               for: indexPath) as! DealCell
        let deal:Deal = deals[indexPath.row]
        cell.setup(deal: deal)
        return cell
    }
}
