//
//  UserOptionsViewController.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/5/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation
import UIKit

class UserOptionsViewController: UITableViewController {
    
    var okButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        setupTableView()
        setupNavBar()
    }
    
    func setupTableView() {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background"))
        tableView.register(OptionDisplayCell.self, forCellReuseIdentifier: OptionDisplayCell.REUSE_IDENTIFIER)
    }
    
    func setupNavBar() {
        okButton = UIBarButtonItem(image: UIImage(named: "OkButton")!,
                                   style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let navTitle = UIImage(named: "OptionsTitle")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let navTitleView = UIImageView(image: navTitle)
        self.navigationItem.titleView = navTitleView
        self.navigationItem.titleView?.isHidden = false
        self.navigationItem.rightBarButtonItem = okButton
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - UITableViewDatasource
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(80)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionDisplayCell = self.tableView.dequeueReusableCell(withIdentifier: OptionDisplayCell.REUSE_IDENTIFIER) as! OptionDisplayCell
        switch(indexPath.row) {
            case 0: customizeVisaClassCell(cell: optionDisplayCell)
            case 1: customizePriorityDateCell(cell: optionDisplayCell)
            default: return self.tableView.dequeueReusableCell(withIdentifier: OptionDisplayCell.REUSE_IDENTIFIER) as! OptionDisplayCell
        }

        return optionDisplayCell
    }
    
    func customizeVisaClassCell(cell: OptionDisplayCell) {
        cell.customize(inputLableText: "Visa Class", optionLabelText: "1st")
    }
    
    func customizePriorityDateCell(cell: OptionDisplayCell) {
        cell.customize(inputLableText: "Priority Date", optionLabelText: "01/01/2015")
    }

    
}
