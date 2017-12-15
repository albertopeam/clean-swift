//
//  ViewController.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let presenter: DealsPresenter
    fileprivate var deals:Array<Deal> = Array()

    
    init(presenter: DealsPresenter) {
        self.presenter = presenter
        super.init(nibName: "DealsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            deals = try GetDeals().get()
            collectionView.reloadData()
        } catch let error as NetworkError{
            print("Networ error: \(error.code as Optional) [\(error.error as Optional)")
        } catch {
            print(error)
        }
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

