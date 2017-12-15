//
//  ViewController.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController {

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
        //dealsView.collectionView.register(DealCell.self, forCellWithReuseIdentifier: "deal_cell")
        dealsView.collectionView.register(UINib(nibName: "DealCell", bundle: nil), forCellWithReuseIdentifier: "deal_cell")
        do {
            let deals:Array<Deal> = try GetDeals().get()
            dealsView.reloadData(deals: deals)
        } catch let error as NetworkError{
            print("Networ error: \(error.code as Optional) [\(error.error as Optional)")
        } catch {
            print(error)
        }
    }
    
    

    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Its an alert", message: "its a message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            NSLog("Action");
        }))
        present(alert, animated: true) {
            NSLog("clicked");
        }
    }
}

