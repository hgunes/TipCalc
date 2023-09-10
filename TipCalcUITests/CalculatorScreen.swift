//
//  CalculatorScreen.swift
//  TipCalcUITests
//
//  Created by Harun Gunes on 10/09/2023.
//

import XCTest

class CalculatorScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var totalAmountPerPersonValueLabel: XCUIElement {
        return
            app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
    }
    
    var totalBillValueLabel: XCUIElement {
        return
            app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        return
            app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
}
