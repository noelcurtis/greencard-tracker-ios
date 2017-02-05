//
//  ViewController.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/3/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var visaBulletinClient: VisaBulletinClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visaBulletinClient.getLatestBulletin { (bulletin, error) in
            print(bulletin as! Bulletin)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

