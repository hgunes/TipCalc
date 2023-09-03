//
//  TipCalcSnapshotTests.swift
//  TipCalcTests
//
//  Created by Harun Gunes on 03/09/2023.
//

import XCTest
import SnapshotTesting
@testable import TipCalc

class TipCalcSnapshotTests: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    // MARK: - LogoView
    
    func testLogoView() {
        // given
        let size = CGSize(width: screenWidth, height: 48)
        // when
        let view = LogoView()
        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }
    
    // MARK: - ResultView
    
    func testInitialResultView() {
        // given
        let size = CGSize(width: screenWidth, height: 224)
        // when
        let view = ResultView()
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testResultViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(
            amountPerPerson: 100.25,
            totalBill: 45,
            totalTip: 60)
        // when
        let view = ResultView()
        view.configure(result: result)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    // MARK: - BillInputView
    
    func testInitialBillInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }
    
    func testBillInputViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        let result = Result(
            amountPerPerson: 100.25,
            totalBill: 45,
            totalTip: 60)
        // when
        let view = BillInputView()
        let textField = view.allSubViewsOf(type: UITextField.self).first
        textField?.text = "500"
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    // MARK: - TipInputView
    
    func testInitialTipInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+15)
        
        // when
        let view = TipInputView()
        
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testTipInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+15)
        
        // when
        let view = TipInputView()
        let button = view.allSubViewsOf(type: UIButton.self).first
        button?.sendActions(for: .touchUpInside)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    // MARK: - SplitInputView
    
    func testInitialSplitInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = SplitInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }
    
    func testSplitInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = SplitInputView()
        let button = view.allSubViewsOf(type: UIButton.self).last
        button?.sendActions(for: .touchUpInside)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
}

extension UIView {
    /**
     This is a function to get subViews of a particular type from view recursively.
     It would look recursively in all subviews and return back the subviews of the type T
     */
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}
