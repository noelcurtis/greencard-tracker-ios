//
//  OptionDisplayCell.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/5/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation
import UIKit


class OptionDisplayCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let inputLabel: UILabel = UILabel()
    let optionTextField: UITextField = UITextField()
    var visaClassUiPickerView: UIPickerView!
    var datePicker: UIDatePicker!
    var outputValue: Any!
    lazy var dateTimeFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.dateStyle = .short
        dt.timeStyle = .none
        return dt
    }()
    
    class var REUSE_IDENTIFIER : String {
        return "option_display_cell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeAsDateInput(inputLableText: String, userOptions: UserOptions?) {
        setupPickers()
        setupViews()
        
        optionTextField.inputView = datePicker
        
        self.inputLabel.text = inputLableText
        if let someUserOptions = userOptions {
            optionTextField.text = dateTimeFormatter.string(from: someUserOptions.priorityDate)
        } else {
            optionTextField.text = dateTimeFormatter.string(from: datePicker.date)
        }
    }
    
    func customizeAsVisaClassInput(inputLableText: String, userOptions: UserOptions?) {
        setupPickers()
        setupViews()
        
        optionTextField.inputView = visaClassUiPickerView
        
        self.inputLabel.text = inputLableText
        if let someUserOptions = userOptions {
            optionTextField.text = someUserOptions.applicationFamily.rawValue
            visaClassUiPickerView.selectRow(EmploymentSponsoredVisaClass.allValuesPositions[someUserOptions.applicationFamily]!, inComponent: 0, animated: false)
        } else {
            optionTextField.text = EmploymentSponsoredVisaClass.allValues[1].rawValue
        }
    }
    
    func setupPickers() {
        visaClassUiPickerView = UIPickerView()
        visaClassUiPickerView.delegate = self
        visaClassUiPickerView.dataSource = self
        
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    func setupViews() {
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        inputLabel.text = "Priority Date"
        inputLabel.tintColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)
        inputLabel.textColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)
        
        optionTextField.translatesAutoresizingMaskIntoConstraints = false
        optionTextField.font = UIFont(name: "AvenirNext-Medium", size: 20)
        optionTextField.text = "01/01/2017"
        optionTextField.tintColor = UIColor.clear
        optionTextField.textColor = self.tintColor
        optionTextField.textAlignment = NSTextAlignment.right
        
        
        self.addSubview(inputLabel)
        self.addSubview(optionTextField)
        
        let viewsDictionary : [String: Any] = ["input_label": inputLabel, "option_label": optionTextField]
        let inputLabelHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[input_label]-[option_label(==140)]-20-|", options: [], metrics: nil, views: viewsDictionary)
        let inputLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[input_label]-|", options: [], metrics: nil, views: viewsDictionary)
        let optionLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[option_label]-|", options: [], metrics: nil, views: viewsDictionary)
        
        self.addConstraints(inputLabelHorizontalConstraints)
        self.addConstraints(optionLabelVerticalConstraints)
        self.addConstraints(inputLabelVerticalConstraints)
    }
    
    func dateChanged(_ datePicker: UIDatePicker) {
        optionTextField.text =  dateTimeFormatter.string(from: datePicker.date)
        outputValue = datePicker.date
    }
    
    func getInputPickerView() -> UIPickerView {
        return self.visaClassUiPickerView
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EmploymentSponsoredVisaClass.allValues.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return EmploymentSponsoredVisaClass.allValues[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionTextField.text = EmploymentSponsoredVisaClass.allValues[row].rawValue
        outputValue = EmploymentSponsoredVisaClass.allValues[row]
    }
    
}
