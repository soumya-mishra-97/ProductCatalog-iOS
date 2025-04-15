# ProductCatalog-iOS
SwiftUI-based iOS application that displays a product catalog with filtering and favoriting capabilities.

**Features**

- Display a catalog of 100+ products loaded from a JSON file.
- Filter products by category, favorites, or all items using a sidebar.
- Mark products as favorites, using UserDefaults.

**Architecture**
- MVVM: Separates the UI (Views), business logic (ViewModels), and data models (Models).
- Combine: Used for reactive updates to the UI based on changes in the ViewModel.
- SOLID Principles:
  - S: ProductService and ProductListViewModel have single responsibilities.
  - O: Extensible filtering mechanism via FilterType.
  - L: Not applicable (no inheritance).
  - I: ProductServiceProtocol ensures a focused interface.
  - D: Dependency injection of ProductServiceProtocol into ProductListViewModel.

**Usage**
- List View: Displays products in a vertical list with a sidebar for filtering.
- Filters: Select "All", "Favorites", or a category from the sidebar to filter products.
- Favorites: Tap the heart icon on a product card to toggle its favorite status.
- Navigation: Use the navigation bar to view the "Product Catalog" title.

**Setup**
- Clone the repository
  - git clone git@github.com:soumya-mishra-97/ProductCatalog-iOS.git
