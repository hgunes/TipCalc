//
//  ThemeFont.swift
//  TipCalc
//
//  Created by Harun Gunes on 10/08/2023.
//

import UIKit

struct ThemeFont {
    // AvenirNext
    
    // regular
    static func regular(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    // bold
    static func bold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    // demibold
    static func demiBold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
    }
}
