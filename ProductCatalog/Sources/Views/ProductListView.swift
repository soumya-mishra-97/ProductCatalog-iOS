//
//  ProductListView.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @State private var isGridView = false
    
    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                SidebarFilterView(viewModel: viewModel)
                    .frame(width: 165)
                
                List(viewModel.filteredProducts) { product in
                    ProductCardView(product: product, toggleFavorite: {
                        viewModel.toggleFavorite(for: product)
                    })
                    .listRowBackground(Color.clear)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                }
            }.navigationBarTitle("Product Catalog", displayMode: .automatic)
        }
    }
}

#Preview {
    ProductListView()
}
