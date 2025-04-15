//
//  ProductService.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() throws -> [Product]
}

final class ProductService: ProductServiceProtocol {
    func fetchProducts() throws -> [Product] {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON file not found"])
        }
        let data = try Data(contentsOf: url)
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products
    }
}
