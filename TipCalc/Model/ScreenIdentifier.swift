//
//  ScreenIdentifier.swift
//  TipCalc
//
//  Created by Harun Gunes on 10/09/2023.
//

import Foundation

enum ScreenIdentifier {
    
    enum LogoView: String {
        case logoView
    }
    
    enum ResultView: String {
        case totalAmountPerPersonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }
    
    enum BillInputView: String {
        case textField
    }
    
    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercentButton
        case twentyPercentButton
        case customTipButton
        case customTipAlertTextField
    }
    
    enum CustomTipAlert: String {
        case alertOkButton
        case alertCancelButton
    }
    
    enum SplitInputView: String {
        case decrementButton
        case qtyValueLabel
        case incrementButton
    }
}
