//
//  Extensions.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

extension View {
    func neumorphic(isPressed: Bool = false) -> some View {
        modifier(NeumorphicStyle(isPressed: isPressed))
    }
    
    func sidebarButtonStyle(isSelected: Bool) -> some View {
        modifier(SidebarButtonStyle(isSelected: isSelected))
    }
}


extension Font {
    static let customMonospacedSemibold14 = Font.system(size: 14, weight: .semibold, design: .monospaced)
    static let customMonospacedThin11 = Font.system(size: 11, weight: .thin, design: .monospaced)
    static let customMonospacedRegular12 = Font.system(size: 12, weight: .regular, design: .monospaced)
}
