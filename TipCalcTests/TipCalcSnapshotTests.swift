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
    
    // MARK: - BillInputView
    
    func testBillInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
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
    
    // MARK: - SplitInputView
    
    func testInitialSplitInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = SplitInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size), record: false)
    }
}
