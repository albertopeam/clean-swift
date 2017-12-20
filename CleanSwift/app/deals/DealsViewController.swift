//
//  ViewController.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController, UISearchBarDelegate {

    fileprivate let presenter: DealsPresenter
    
    init(presenter: DealsPresenter) {
        self.presenter = presenter
        super.init(nibName: "DealsView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dealsView:DealsView = view as! DealsView
        dealsView.collectionView.register(UINib(nibName: "DealCell", bundle: nil), forCellWithReuseIdentifier: "deal_cell")
        presenter.view = self;
        presenter.obtainDeals()
    }
    
    func onLoadedDeals(deals: Array<Deal>) -> Void {
        let dealsView:DealsView = view as! DealsView
        dealsView.reloadData(deals: deals)
    }
    
    func onLoadedDealsException(exception: Exception) -> Void {
        let alert = UIAlertController(title: "Error", message: exception.localizedDescription(), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
        present(alert, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.searchDeals(searchTerm: searchBar.text ?? "")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        presenter.obtainDeals()
    }
}

