//
//  ThemeManager.swift
//  ImageRecognitionProject
//
//  Created by aasveen on 7/28/18.
//  Copyright © 2018 Aasveen. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    /**
     Creates an UIColor Object based on provided RGB value in integer
     - parameter red:   Red Value in integer (0-255)
     - parameter green: Green Value in integer (0-255)
     - parameter blue:  Blue Value in integer (0-255)
     - returns: UIColor with specified RGB values
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}


enum Color {
    
    case theme
    case fruitButtonColor
    case shapeButtonColor
    case colorButtonColor
    case flowerButtonColor
    case beigeTextColor
    case darkTextColor
    // 1
    case custom(hexString: String, alpha: Double)
    // 2
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .theme:
            instanceColor = UIColor(red: 59, green: 77, blue: 100)
        case .fruitButtonColor:
            instanceColor = UIColor(red: 125, green: 158, blue: 168)
        case .shapeButtonColor:
            instanceColor = UIColor(red: 241, green: 209, blue: 193)
        case .colorButtonColor:
            instanceColor =  UIColor(red: 59, green: 77, blue: 100)
        case .flowerButtonColor:
            instanceColor = UIColor(red: 240  , green: 120, blue: 112)
        case .beigeTextColor:
            instanceColor = UIColor(red: 229  , green: 221, blue: 214)
        case .darkTextColor:
            instanceColor = UIColor(red: 59, green: 77, blue: 100)
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}

enum myFont {
    case theme
    case fruitButtonFont, shapeButtonFont, colorButtonFont, flowerButtonFont
}

extension myFont {
    var value:UIFont {
        var instanceColor = UIFont()
        
        switch self {
        case .fruitButtonFont, .shapeButtonFont, .colorButtonFont, .flowerButtonFont :
            instanceColor =  UIFont(name: "Chalkduster", size: 30)!
        case .theme :
            instanceColor =  UIFont(name: "Chalkduster", size: 25)!
        }
        return instanceColor
    }
}
