//
//  VisaStatusViewController.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/25/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation
import UIKit

class VisaStatusViewController: UIViewController {
    
    var userOptions: UserOptions! = UserOptions()
    var settingsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        setupNavBar()
    }
    
    
    func setupNavBar() {
        settingsButton = UIBarButtonItem(image: UIImage(named: "SettingsButton")!,
                                   style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        self.navigationItem.titleView?.isHidden = true
        self.navigationItem.leftBarButtonItem = settingsButton
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
    }
}
