//
//  SidebarFilterView.swift
//  ProductCatalog
//
//  Created by Soumya Ranjan Mishra on 15/04/25.
//

import SwiftUI

struct SidebarFilterView: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Button(action: {
                    viewModel.filter = .all
                    viewModel.selectedCategory = nil
                }) {
                    Text("All")
                        .sidebarButtonStyle(isSelected: viewModel.filter == .all)
                }
                .neumorphic(isPressed: viewModel.filter == .all)
                
                Button(action: {
                    viewModel.filter = .favorites
                    viewModel.selectedCategory = nil
                }) {
                    Text("Favorites")
                        .sidebarButtonStyle(isSelected: viewModel.filter == .favorites)
                }
                .neumorphic(isPressed: viewModel.filter == .favorites)
                
                ForEach(viewModel.categories, id: \.self) { category in
                    Button(action: {
                        viewModel.filter = .category(category)
                        viewModel.selectedCategory = category
                    }) {
                        Text(category)
                            .sidebarButtonStyle(isSelected: viewModel.selectedCategory == category)
                    }
                    .neumorphic(isPressed: viewModel.selectedCategory == category)
                }
            }
            .padding(15)
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    SidebarFilterView(
        viewModel: ProductListViewModel()
    )
}
