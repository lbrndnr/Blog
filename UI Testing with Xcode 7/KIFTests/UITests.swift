//
//  UITests.swift
//  UITests
//
//  Created by Laurin Brandner on 20/06/15.
//  Copyright © 2015 Laurin Brandner. All rights reserved.
//

import XCTest
import KIF

private let tableViewID = "ViewControllerTableView"
private let detailID = "DetailViewControllerDetail"
private let alertID = "ViewControllerAlert"

class UITests: XCTestCase {
    
    func testDetail() {
        tester().tapRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableViewWithAccessibilityIdentifier: tableViewID)
        tester().waitForViewWithAccessibilityIdentifier(detailID)
        tester().tapViewWithAccessibilityLabel("UI Testing")
        tester().waitForAnimationsToFinish()
        XCTAssertFalse(tester().tryFindingViewWithAccessibilityIdentifier(detailID), "Coulnd't dismiss detail view")
    }
    
    func testPopover() {
        tester().tapRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), inTableViewWithAccessibilityIdentifier: tableViewID)
        tester().waitForViewWithAccessibilityIdentifier(alertID)
        tester().tapViewWithAccessibilityLabel("OK")
        XCTAssertFalse(tester().tryFindingViewWithAccessibilityIdentifier(alertID), "Coulnd't dismiss action sheet")
    }

    func testActionSheet() {
        tester().tapRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0), inTableViewWithAccessibilityIdentifier: tableViewID)
        tester().waitForViewWithAccessibilityIdentifier(alertID)
        tester().tapViewWithAccessibilityLabel("OK")
        XCTAssertFalse(tester().tryFindingViewWithAccessibilityIdentifier(alertID), "Coulnd't dismiss action sheet")
    }
    
    func testEverything() {
        let date = NSDate()
        
        for i in 0..<20 {
            testDetail()
            testPopover()
            testActionSheet()
        }
        
        let duration = NSDate().timeIntervalSinceDate(date)
        println(duration)
    }
    
}
