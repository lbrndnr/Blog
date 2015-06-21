//
//  UITests.swift
//  UITests
//
//  Created by Laurin Brandner on 15/06/15.
//  Copyright © 2015 Laurin Brandner. All rights reserved.
//

import Foundation
import XCTest

class UITests: XCTestCase {
    
    private var launched = false
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        launchIfNecessary()
    }
    
    private func launchIfNecessary() {
        if !launched {
            launched = true
            app.launchEnvironment = ["animations": "0"]
            app.launch()
        }
    }

    func testDetail() {
        app.tables.staticTexts["Detail View Controller"].tap()
        let detail = app.staticTexts["Detail"]
        app.navigationBars["UI Testing"].buttons["UI Testing"].tap()
        XCTAssertFalse(detail.exists)
    }
    
    func testPopover() {
        app.tables.staticTexts["Popover"].tap()
        let popover = app.alerts.staticTexts["Popover"]
        app.alerts["Popover"].buttons["OK"].tap()
        XCTAssertFalse(popover.exists)
    }
    
    func testActionSheet() {
        app.tables.staticTexts["Action Sheet"].tap()
        let actionSheet = app.sheets.staticTexts["Action Sheet"]
        app.sheets["Action Sheet"].buttons["OK"].tap()
        XCTAssertFalse(actionSheet.exists)
    }
    
//    func testEverything() {
//        let date = NSDate()
//        
//        for _ in 0..<5 {
//            app.launch()
//            testDetail()
//            app.launch()
//            testPopover()
//            app.launch()
//            testActionSheet()
//        }
//        
//        let duration = NSDate().timeIntervalSinceDate(date)
//        print(duration)
//    }
    
}
