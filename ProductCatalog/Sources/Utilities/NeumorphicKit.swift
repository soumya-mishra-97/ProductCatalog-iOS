//
//  NeumorphicKit.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

struct NeumorphicKit {
    
    public static var colorSchemeType: ColorSchemeType = .light
    
    public enum ColorSchemeType {
        case light
    }
    
#if os(macOS)
    public typealias ColorType = NSColor
    public static func colorType(red: CGFloat, green: CGFloat, blue: CGFloat) -> ColorType {
        .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
#else
    public typealias ColorType = UIColor
    public static func colorType(red: CGFloat, green: CGFloat, blue: CGFloat) -> ColorType {
        .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
#endif
    
    public static func color(light: ColorType) -> Color {
        Color(light)
    }
}
