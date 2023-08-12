//
//  AmountView.swift
//  TipCalc
//
//  Created by Harun Gunes on 12/08/2023.
//

import UIKit

class AmountView: UIView {
    
    let title: String
    let textAlignment: NSTextAlignment
    
    private lazy var titleLabel: UILabel = {
        LabelFactory
            .build(text: title,
                   font: ThemeFont.regular(ofSize: 18),
                   textColor: ThemeColor.text,
                   textAlignment: textAlignment)
        
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.textColor = ThemeColor.primary
        let text = NSMutableAttributedString(string: "$000",
                                             attributes: [.font: ThemeFont.bold(ofSize: 24)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 16)],
                           range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            amountLabel
        ])
        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.alignment = .center
        return stackView
    }()
    
    
    
    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
//            make.edges.equalTo(snp.edges)
            make.edges.equalToSuperview()
        }
    }
    
}