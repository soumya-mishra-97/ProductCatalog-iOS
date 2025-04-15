//
//  ProductCardView.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    let toggleFavorite: () -> Void
    let cardPadding: CGFloat
    
    init(product: Product, toggleFavorite: @escaping () -> Void, cardPadding: CGFloat = 10) {
        self.product = product
        self.toggleFavorite = toggleFavorite
        self.cardPadding = cardPadding
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.Neumorphic.darkShadow)
            .frame(width: 200, height: 120)
            .overlay(
                ZStack(alignment: .bottomTrailing) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.name)
                            .font(.customMonospacedSemibold14)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(product.category)
                            .font(.customMonospacedThin11)
                            .foregroundColor(.black.opacity(0.8))
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.customMonospacedRegular12)
                    }
                    .padding(.all, cardPadding)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: toggleFavorite) {
                        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                }
            )
    }
}

#Preview {
    Group {
        ProductCardView(
            product: Product(
                id: 1,
                name: "Samsung Galaxy S23",
                category: "Electronics",
                price: 113.24,
                isFavorite: false
            ),
            toggleFavorite: {}
        )
        ProductCardView(
            product: Product(
                id: 2,
                name: "L'Oréal Paris Revitalift",
                category: "Fashion",
                price: 142.80,
                isFavorite: true
            ),
            toggleFavorite: {}
        )
    }
}
