//
//  OutputTextTests.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/26/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import XCTest
@testable import GreencardTracker


class OutputTextTests: XCTestCase {
    
    var bulletin: Bulletin!
    
    override func setUp() {
        super.setUp()
        
        let path = Bundle.main.url(forResource: "febBulletin", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        self.bulletin = Bulletin.from(jsonData: data)
    }
    
    func test_outputTextWithBulletin_isCurrent() {
        let userOptions = UserOptions()
        userOptions.applicationFamily = EmploymentSponsoredVisaClass.first
        userOptions.caseArea = CaseArea.all
        
        let outputText = OutputText.getOutputText(from: userOptions, for: bulletin)
        XCTAssert(outputText.titleText == "Your priority date is", "Title text should be \"Your priority date is\"")
        XCTAssert(outputText.subTitleText == "Current", "Title text should be \"Current\"")
    }
    
    func test_outputTextWithBulletin_isNotCurrent() {
        let userOptions = UserOptions()
        userOptions.applicationFamily = EmploymentSponsoredVisaClass.second
        userOptions.caseArea = CaseArea.china
        
        let outputText = OutputText.getOutputText(from: userOptions, for: bulletin)
        XCTAssert(outputText.titleText == "The next priority date for your visa class will be", "Title text should be \"The next priority date for your visa class will be\"")
        XCTAssert(outputText.subTitleText == "3/1/13", "Title text should be \"3/1/13\"")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_outputTextWithoutBulletin_noUserOptions() {
        let userOptions = UserOptions()
        userOptions.applicationFamily = EmploymentSponsoredVisaClass.second
        userOptions.caseArea = CaseArea.china
        let outputText = OutputText.getOutputText(from: userOptions, for: nil)
        
        XCTAssert(outputText.titleText == "Could not fetch status of your visa class, please try again later")
    }
    
}
