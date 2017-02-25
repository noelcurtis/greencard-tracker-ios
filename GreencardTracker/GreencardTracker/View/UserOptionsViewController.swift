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
    var userOptions: UserOptions! = UserOptions()
    
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
                                   style: UIBarButtonItemStyle.plain, target: self, action: #selector(updateUserOptions(uiBarButtonItem:)))
        
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
        cell.customizeAsVisaClassInput(inputLableText: "Visa Class", userOptions: userOptions)
    }
    
    func customizePriorityDateCell(cell: OptionDisplayCell) {
        cell.customizeAsDateInput(inputLableText: "Priority Date", userOptions: userOptions)
    }
    
    func getUserOptions() -> UserOptions {
        let userOptions = UserOptions()
        if let optionDisplayCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0))! as? OptionDisplayCell {
            if optionDisplayCell.outputValue is Date {
                userOptions.priorityDate = optionDisplayCell.outputValue as! Date
            } else if optionDisplayCell.outputValue is EmploymentSponsoredVisaClass {
                userOptions.applicationFamily = optionDisplayCell.outputValue as! EmploymentSponsoredVisaClass
            }
        } else {
          // add some logging
        }
        
        if let optionDisplayCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0))! as? OptionDisplayCell {
            if optionDisplayCell.outputValue is Date {
                userOptions.priorityDate = optionDisplayCell.outputValue as! Date
            } else if optionDisplayCell.outputValue is EmploymentSponsoredVisaClass {
                userOptions.applicationFamily = optionDisplayCell.outputValue as! EmploymentSponsoredVisaClass
            }
        } else {
            // add some logging
        }
        return userOptions
    }
    
    func updateUserOptions(uiBarButtonItem: UIBarButtonItem) {
        userOptions = getUserOptions()
    }

}
