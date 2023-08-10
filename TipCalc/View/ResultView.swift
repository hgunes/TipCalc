//
//  ResultView.swift
//  TipCalc
//
//  Created by Harun Gunes on 10/08/2023.
//

import UIKit

class ResultView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .orange
    }
}
