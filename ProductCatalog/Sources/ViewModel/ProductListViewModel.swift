//
//  ProductListViewModel.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import Combine
import Foundation

enum FilterType: Equatable {
    case all
    case favorites
    case category(String)
}

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var filter: FilterType = .all
    @Published var selectedCategory: String? = nil
    
    private let productService: ProductServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    private let favoritesKey = "favorites"
    
    var filteredProducts: [Product] {
        switch filter {
        case .all:
            return products
        case .favorites:
            return products.filter { $0.isFavorite }
        case .category(let category):
            return products.filter { $0.category == category }
        }
    }
    
    var categories: [String] {
        Array(Set(products.map { $0.category })).sorted()
    }
    
    init(productService: ProductServiceProtocol = ProductService()) {
        self.productService = productService
        loadProducts()
        setupBindings()
    }
    
    private func loadProducts() {
        do {
            products = try productService.fetchProducts()
            loadFavorites()
        } catch {
            print("Failed to load products: \(error)")
            products = []
        }
    }
    
    private func setupBindings() {
        $filter
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    func toggleFavorite(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isFavorite.toggle()
            
        }
    }
    
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let favoriteIDs = try? JSONDecoder().decode([Int].self, from: data) {
            products = products.map { product in
                var updatedProduct = product
                updatedProduct.isFavorite = favoriteIDs.contains(product.id)
                return updatedProduct
            }
        }
    }
    
    private func saveFavorites() {
        let favoriteIDs = products.filter { $0.isFavorite }.map { $0.id }
        if let data = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
}
