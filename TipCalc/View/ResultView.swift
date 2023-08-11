//
//  ResultView.swift
//  TipCalc
//
//  Created by Harun Gunes on 10/08/2023.
//

import UIKit

class ResultView: UIView {
    
    private let headerLabel: UILabel = {
        LabelFactory.build(text: "Total p/person",
                           font: ThemeFont.demiBold(ofSize: 18))
    }()
    
    private let amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(string: "$0", attributes: [.font: ThemeFont.bold(ofSize: 48)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)],
                           range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerLabel,
            amountPerPersonLabel,
            horizontalLineView,
            hStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            AmountView(),
            UIView(),
            AmountView()
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .white
        addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(20)
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-24)
        }
        
        horizontalLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        addShadow(offset: CGSize(width: 0, height: 3),
                  color: .black,
                  radius: 12,
                  opacity: 0.1)
    }
}

class AmountView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        backgroundColor = .red
    }
    
}
