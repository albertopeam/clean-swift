//
//  DealsView.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 15/12/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import Foundation
import UIKit

class DealsView:UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var refreshControl:UIRefreshControl!
    fileprivate let insets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 16.0, right: 10.0)
    fileprivate var deals:Array<Deal> = Array()
    
    func setup(target: AnyObject, selector: Selector) -> Void {
        collectionView.register(UINib(nibName: "DealCell", bundle: nil), forCellWithReuseIdentifier: "deal_cell")
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
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
        let cell:DealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "deal_cell", for: indexPath) as! DealCell
        let deal:Deal = deals[indexPath.row]
        cell.setup(deal: deal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 132)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
  
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insets.top
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deal:Deal = deals[indexPath.row]
        let url = URL(string:"http://www.cheapshark.com/redirect?dealID="+deal.dealId)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    func loading(visibility: Bool) -> Void {
        if visibility {
            refreshControl.beginRefreshing()
        }else{
            refreshControl.endRefreshing()
        }
    }
    
    func cleanSearch() -> Void {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
