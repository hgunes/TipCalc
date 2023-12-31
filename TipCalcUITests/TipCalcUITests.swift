//
//  TipCalcUITests.swift
//  TipCalcUITests
//
//  Created by Harun Gunes on 10/08/2023.
//

import XCTest

final class TipCalcUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
    }
    
    func testRegularTip() {
        // User enters a $100 bill
        screen.enterBill(amount: 100)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$100")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$100")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
        
        // Selects %10 tip
        screen.selectTip(tip: .tenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$110")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$110")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$10")
        
        // Selects %15 tip
        screen.selectTip(tip: .fifteenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$115")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$115")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$15")
        
        // Selects %20 tip
        screen.selectTip(tip: .twentyPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
        
        // User splits the bill
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
        XCTAssertEqual(screen.splitValueLabel.label, "4")

        screen.selectDecrementButton(numberOfTaps: 1)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$40")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$20")
        XCTAssertEqual(screen.splitValueLabel.label, "3")
    }
    
    func testCustomTipFlow() {
        screen.enterBill(amount: 300)
        screen.selectTip(tip: .customPercent(value: 200))
        screen.alertOkButtonPressed()
        screen.selectIncrementButton(numberOfTaps: 1)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$250")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$500")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$200")
        XCTAssertEqual(screen.customTipButton.label, "$200")
        XCTAssertEqual(screen.splitValueLabel.label, "2")
    }
    
    func testResetButton() {
        screen.enterBill(amount: 300)
        screen.selectTip(tip: .customPercent(value: 200))
        screen.alertOkButtonPressed()
        screen.selectIncrementButton(numberOfTaps: 1)
        screen.doubleTapLogoView()
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.billInputViewTextField.label, "")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
        XCTAssertEqual(screen.customTipButton.label, "Custom tip")
        XCTAssertEqual(screen.splitValueLabel.label, "1")
    }
}
