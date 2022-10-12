//
//  ExtensionColors.swift
//  MyHabits
//
//  Created by Darya on 29.08.2022.
//

import UIKit

public extension UIColor {
    static let habitLightestGray = UIColor.rgb(242, 242, 247)
    static let habitViolet = UIColor.rgb(161, 22, 204)
    static let habitBlue = UIColor.rgb(41, 109, 255)
    static let habitGreen = UIColor.rgb(29, 179, 34)
    static let habitOrange = UIColor.rgb(255, 159, 79)
    static let habitIndigo = UIColor.rgb(98, 54, 255)
}

public extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.rgba(r, g, b, 1.0)
    }
    
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
