//
//  Product.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let category: String
    let price: Double
    var isFavorite: Bool
}
