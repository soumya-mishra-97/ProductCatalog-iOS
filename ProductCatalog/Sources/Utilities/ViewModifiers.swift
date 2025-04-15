//
//  ViewModifiers.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

struct NeumorphicStyle: ViewModifier {
    var isPressed: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.Neumorphic.main)
            .cornerRadius(10)
            .shadow(
                color: isPressed ? Color.Neumorphic.darkShadow : Color.Neumorphic.lightShadow,
                radius: 6, x: isPressed ? 6 : -6, y: isPressed ? 6 : -6
            )
            .shadow(
                color: isPressed ? Color.Neumorphic.lightShadow : Color.Neumorphic.darkShadow,
                radius: 6, x: isPressed ? -6 : 6, y: isPressed ? -6 : 6
            )
    }
}

struct SidebarButtonStyle: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .semibold, design: .monospaced))
            .foregroundColor(isSelected ? .blue : .primary)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
