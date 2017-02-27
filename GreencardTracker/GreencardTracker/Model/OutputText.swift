//
//  OutputText.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/25/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation
import UIKit

class OutputText {
    var titleText: String! = "Your priority date is"
    var subTitleText: String! = "Current"
    var isCurrent: Bool! = true
    static var dateTimeFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.dateStyle = .short
        dt.timeStyle = .none
        return dt
    }()
    
    static func current() -> OutputText {
        return OutputText()
    }
    
    static func notCurrent(nextDate: Date) -> OutputText {
        let outputText = OutputText()
        outputText.titleText = "The next priority date for your visa class will be"
        outputText.subTitleText = dateTimeFormatter.string(from: nextDate)
        outputText.isCurrent = false
        return outputText
    }
    
    static func getOutputText(from userOptions: UserOptions, for bulletin: Bulletin?) -> OutputText {
        if let someBulletin = bulletin {
            
            if (!someBulletin.employmentSponsoredTable.isEmpty) {
                // get the applicable visa class row
                let position = EmploymentSponsoredVisaClass.allValuesPositions[userOptions.applicationFamily]!
                let employmentSponsoredRow: EmploymentSponsoredRow = someBulletin.employmentSponsoredTable[position]
                let dateOrCurrent = employmentSponsoredRow.getDateOrCurrent(userOptions.caseArea)
                if (dateOrCurrent.isCurrent) {
                    return OutputText.current()
                } else {
                    if let someDate = dateOrCurrent.date {
                        return OutputText.notCurrent(nextDate: someDate)
                    }
                }
            }
            
        }
        // TODO: Log some error
        let outputText = OutputText()
        outputText.titleText = "Could not fetch status of your visa class, please try again later"
        return outputText
    }
    
    func subTitleColor() -> UIColor {
        if (isCurrent!) {
            return UIColor(red:0.39, green:0.65, blue:0.09, alpha:1.0)
        } else {
            return UIColor(red:0.56, green:0.20, blue:0.20, alpha:1.0)
        }
    }
}
