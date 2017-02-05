//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport


var str = "Hello, playground"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

// classes
class DateOrCurrent {
    let date: Date?
    let isCurrent: Bool
    
    init() {
        date = nil
        isCurrent = false
    }
    
    init(json: [String: Any]) {

        if let someDate = json["date"] as? String {
            date = dateFormatter.date(from: someDate)
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
    
    init() {
        date = Date()
        finalActionFamilySponsoredTable = [FamilySponsoredRow]()
        familySponsoredTable = [FamilySponsoredRow]()
        finalActionEmploymentSponsoredTable = [EmploymentSponsoredRow]()
        employmentSponsoredTable = [EmploymentSponsoredRow]()
    }
    
    init(json: [String: Any]) {
        
        if let someDate = json["date"] as? String {
            date = dateFormatter.date(from: someDate)!
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
    
    static func from(jsonData: Data) -> Bulletin {
        let bulletinAsJson = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        return Bulletin(json: bulletinAsJson as! [String: Any])
    }
}

// Parsing a Bulletin
let filePath = Bundle.main.path(forResource: "bulliten", ofType: "json")
let contentData = FileManager.default.contents(atPath: filePath!)!
let parsedBulletin = Bulletin.from(jsonData: contentData)
// Parsing a Bulletin

// Loading contents from a URL
let url = URL(string: "http://stackoverflow.com/")
let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    let value = String(data: data!, encoding: String.Encoding.utf8)
    print(value!)
}
task.resume()


// Let asynchronous code run
PlaygroundPage.current.needsIndefiniteExecution
