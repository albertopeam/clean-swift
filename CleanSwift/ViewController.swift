//
//  ViewController.swift
//  CleanSwift
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 Penas Amor, Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

