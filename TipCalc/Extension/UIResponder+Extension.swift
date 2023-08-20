//
//  UIResponder+Extension.swift
//  TipCalc
//
//  Created by Harun Gunes on 20/08/2023.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
