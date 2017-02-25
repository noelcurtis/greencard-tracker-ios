//
//  Bulletin.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/3/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation

enum EmploymentSponsoredVisaClass: String {
    case first = "1st"
    case second = "2nd"
    case third = "3rd"
    case otherWorkers = "Other Workers"
    case fourth = "4th"
    case religiousWorkers = "Certain Religious Workers"
    case nonRegional = "5th Non-Regional Center (C5 and T5)"
    case regionalCenter = "5th Regional Center (I5 and R5)"
    
    static let allValues = [first, second, third, otherWorkers, fourth, religiousWorkers, nonRegional, regionalCenter]
    
    static let allValuesPositions = [first:0, second:1, third:2, otherWorkers:3, fourth:4, religiousWorkers:5, nonRegional:6, regionalCenter:7]
}

class DateFormat {
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}

class DateOrCurrent {
    let date: Date?
    let isCurrent: Bool
    let dateFormat: DateFormat = DateFormat()
    
    init() {
        date = nil
        isCurrent = false
    }
    
    init(json: [String: Any]) {
        
        
        if let someDate = json["date"] as? String {
            date = dateFormat.dateFormatter.date(from: someDate)
        } else {
            date = nil
        }
        
        if let someIsCurrent = json["isCurrent"] as? Bool {
            isCurrent = someIsCurrent
        } else {
            isCurrent = false
        }
    }
    
}

class EmploymentSponsoredRow {
    let family: String
    let chargeabilityAreas: DateOrCurrent
    let china: DateOrCurrent
    let india: DateOrCurrent
    let mexico: DateOrCurrent
    let phillippines: DateOrCurrent
    let elSalvadorGuatamelaHonduras: DateOrCurrent
    
    init() {
        family = ""
        chargeabilityAreas = DateOrCurrent()
        china = DateOrCurrent()
        india = DateOrCurrent()
        mexico = DateOrCurrent()
        phillippines = DateOrCurrent()
        elSalvadorGuatamelaHonduras = DateOrCurrent()
    }
    
    init(json: [String: Any]) {
        
        if let someFamily = json["family"] as? String {
            family = someFamily
        } else {
            family = ""
        }
        
        if let someChargeabilityAreas = json["chargeabilityAreas"] as? [String: Any] {
            chargeabilityAreas = DateOrCurrent(json: someChargeabilityAreas)
        } else {
            chargeabilityAreas = DateOrCurrent()
        }
        
        if let someChina = json["china"] as? [String: Any] {
            china = DateOrCurrent(json: someChina)
        } else {
            china = DateOrCurrent()
        }
        
        if let someIndia = json["india"] as? [String: Any] {
            india = DateOrCurrent(json: someIndia)
        } else {
            india = DateOrCurrent()
        }
        
        if let someMexico = json["mexico"] as? [String: Any] {
            mexico = DateOrCurrent(json: someMexico)
        } else {
            mexico = DateOrCurrent()
        }
        
        if let somePhillippines = json["phillippines"] as? [String: Any] {
            phillippines = DateOrCurrent(json: somePhillippines)
        } else {
            phillippines = DateOrCurrent()
        }
        
        if let someElSalvadorGuatamelaHonduras = json["elSalvadorGuatamelaHonduras"] as? [String: Any] {
            elSalvadorGuatamelaHonduras = DateOrCurrent(json: someElSalvadorGuatamelaHonduras)
        } else {
            elSalvadorGuatamelaHonduras = DateOrCurrent()
        }
        
    }
}

class FamilySponsoredRow {
    let family: String
    let chargeabilityAreas: DateOrCurrent
    let china: DateOrCurrent
    let india: DateOrCurrent
    let mexico: DateOrCurrent
    let phillippines: DateOrCurrent
    
    init() {
        family = ""
        chargeabilityAreas = DateOrCurrent()
        china = DateOrCurrent()
        india = DateOrCurrent()
        mexico = DateOrCurrent()
        phillippines = DateOrCurrent()
    }
    
    init(json: [String: Any]) {
        
        if let someFamily = json["family"] as? String {
            family = someFamily
        } else {
            family = ""
        }
        
        if let someChargeabilityAreas = json["chargeabilityAreas"] as? [String: Any] {
            chargeabilityAreas = DateOrCurrent(json: someChargeabilityAreas)
        } else {
            chargeabilityAreas = DateOrCurrent()
        }
        
        if let someChina = json["china"] as? [String: Any] {
            china = DateOrCurrent(json: someChina)
        } else {
            china = DateOrCurrent()
        }
        
        if let someIndia = json["india"] as? [String: Any] {
            india = DateOrCurrent(json: someIndia)
        } else {
            india = DateOrCurrent()
        }
        
        if let someMexico = json["mexico"] as? [String: Any] {
            mexico = DateOrCurrent(json: someMexico)
        } else {
            mexico = DateOrCurrent()
        }
        
        if let somePhillippines = json["phillippines"] as? [String: Any] {
            phillippines = DateOrCurrent(json: somePhillippines)
        } else {
            phillippines = DateOrCurrent()
        }
        
    }
}

class Bulletin {
    let date: Date
    let finalActionFamilySponsoredTable: [FamilySponsoredRow]
    let familySponsoredTable: [FamilySponsoredRow]
    let finalActionEmploymentSponsoredTable: [EmploymentSponsoredRow]
    let employmentSponsoredTable: [EmploymentSponsoredRow]
    let dateFormat: DateFormat = DateFormat()
    
    init() {
        date = Date()
        finalActionFamilySponsoredTable = [FamilySponsoredRow]()
        familySponsoredTable = [FamilySponsoredRow]()
        finalActionEmploymentSponsoredTable = [EmploymentSponsoredRow]()
        employmentSponsoredTable = [EmploymentSponsoredRow]()
    }
    
    init(json: [String: Any]) {
        
        if let someDate = json["date"] as? String {
            date = dateFormat.dateFormatter.date(from: someDate)!
        } else {
            date = Date()
        }
        
        if let someFinalActionFamilySponsoredTable = json["finalActionFamilySponsoredTable"] as? [Any] {
            finalActionFamilySponsoredTable = someFinalActionFamilySponsoredTable.map({ (value) -> FamilySponsoredRow in
                return FamilySponsoredRow(json: value as! [String: Any])
            })
        } else {
            finalActionFamilySponsoredTable = [FamilySponsoredRow]()
        }
        
        if let someFamilySponsoredTable = json["familySponsoredTable"] as? [Any] {
            familySponsoredTable = someFamilySponsoredTable.map({ (value) -> FamilySponsoredRow in
                return FamilySponsoredRow(json: value as! [String: Any])
            })
        } else {
            familySponsoredTable = [FamilySponsoredRow]()
        }
        
        
        if let someFinalActionEmploymentSponsoredTable = json["finalActionEmploymentSponsoredTable"] as? [Any] {
            finalActionEmploymentSponsoredTable = someFinalActionEmploymentSponsoredTable.map({ (value) -> EmploymentSponsoredRow in
                return EmploymentSponsoredRow(json: value as! [String: Any])
            })
        } else {
            finalActionEmploymentSponsoredTable = [EmploymentSponsoredRow]()
        }
        
        if let someEmploymentSponsoredTable = json["employmentSponsoredTable"] as? [Any] {
            employmentSponsoredTable = someEmploymentSponsoredTable.map({ (value) -> EmploymentSponsoredRow in
                return EmploymentSponsoredRow(json: value as! [String: Any])
            })
        } else {
            employmentSponsoredTable = [EmploymentSponsoredRow]()
        }
    }
    
    static func from(jsonData: Data) -> Bulletin? {
        if let JSON = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
            return Bulletin(json: JSON!)
        } else {
            return nil
        }
    }
}

