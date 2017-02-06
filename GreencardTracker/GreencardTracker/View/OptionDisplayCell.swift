//
//  OptionDisplayCell.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/5/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation
import UIKit


class OptionDisplayCell: UITableViewCell {
    
    let inputLabel: UILabel = UILabel()
    let optionLabel: UILabel = UILabel()
    
    class var REUSE_IDENTIFIER : String {
        return "option_display_cell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        inputLabel.text = "Priority Date"
        inputLabel.tintColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)
        inputLabel.textColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)
        
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
        optionLabel.text = "01/01/2017"
        optionLabel.tintColor = self.tintColor
        optionLabel.textColor = self.tintColor
        optionLabel.textAlignment = NSTextAlignment.right
        
        self.addSubview(inputLabel)
        self.addSubview(optionLabel)
        
        let viewsDictionary : [String: Any] = ["input_label": inputLabel, "option_label": optionLabel]
        let inputLabelHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[input_label]-[option_label(==140)]-20-|", options: [], metrics: nil, views: viewsDictionary)
        let inputLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[input_label]-|", options: [], metrics: nil, views: viewsDictionary)
        let optionLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[option_label]-|", options: [], metrics: nil, views: viewsDictionary)
        
        self.addConstraints(inputLabelHorizontalConstraints)
        self.addConstraints(optionLabelVerticalConstraints)
        self.addConstraints(inputLabelVerticalConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customize(inputLableText: String, optionLabelText: String) {
        self.inputLabel.text = inputLableText
        self.optionLabel.text = optionLabelText
    }
    
}
