//
//  ColorExtension.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

extension Color {
    struct Neumorphic {
        private static let defaultMainColor = NeumorphicKit.colorType(red: 0.925, green: 0.941, blue: 0.953)
        private static let defaultLightShadowSolidColor = NeumorphicKit.colorType(red: 1.000, green: 1.000, blue: 1.000)
        private static let defaultDarkShadowSolidColor = NeumorphicKit.colorType(red: 0.820, green: 0.851, blue: 0.902)
        
        public static var colorSchemeType: NeumorphicKit.ColorSchemeType {
            get {
                return NeumorphicKit.colorSchemeType
            }
            set {
                NeumorphicKit.colorSchemeType = newValue
            }
        }
        
        public static var main: Color {
            NeumorphicKit.color(light: defaultMainColor)
        }
        
        public static var lightShadow: Color {
            NeumorphicKit.color(light: defaultLightShadowSolidColor)
        }
        
        public static var darkShadow: Color {
            NeumorphicKit.color(light: defaultDarkShadowSolidColor)
        }
    }
}
