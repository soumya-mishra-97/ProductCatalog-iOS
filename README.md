# ProductCatalog-iOS
SwiftUI-based iOS application that displays a product catalog with filtering and favoriting capabilities.

**Features**

- Display a catalog of 100+ products loaded from a JSON file.
- Filter products by category, favorites, or all items using a sidebar.
- Mark products as favorites, using UserDefaults.

**Architecture**
MVVM: Separates the UI (Views), business logic (ViewModels), and data models (Models).
Combine: Used for reactive updates to the UI based on changes in the ViewModel.
SOLID Principles:
S: ProductService and ProductListViewModel have single responsibilities.
O: Extensible filtering mechanism via FilterType.
L: Not applicable (no inheritance).
I: ProductServiceProtocol ensures a focused interface.
D: Dependency injection of ProductServiceProtocol into ProductListViewModel.
