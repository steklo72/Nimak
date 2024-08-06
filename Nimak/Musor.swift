//
//  Musor.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 05.08.2024.
//

import SwiftUI

// Модель данных для товара
struct Product1: Identifiable {
    let id: Int
    let name: String
}

// Модель данных для подкатегории
struct Subcategory1: Identifiable {
    let id: Int
    let name: String
    let products: [Product]
}

// Модель данных для категории
struct Category1: Identifiable {
    let id: Int
    let name: String
    let subcategories: [Subcategory]
}

// ViewModel для управления данными
class CategoryViewModel1: ObservableObject {
    @Published var categories: [Category] = []
    
    func fetchCategories() async {
        // Здесь вы можете сделать реальный сетевой запрос
        // Для примера используем статические данные
        await Task.sleep(2 * 1_000_000_000) // Задержка для имитации сетевого запроса
        
        let sampleProducts = [
            Product1(id: 1, name: "Product 1"),
            Product1(id: 2, name: "Product 2")
        ]
        
        let sampleSubcategories = [
            Subcategory1(id: 1, name: "Subcategory 1", products: sampleProducts),
            Subcategory1(id: 2, name: "Subcategory 2", products: sampleProducts)
        ]
        
        let sampleCategories = [
            Category1(id: 1, name: "Category 1", subcategories: sampleSubcategories),
            Category1(id: 2, name: "Category 2", subcategories: sampleSubcategories)
        ]
        
        DispatchQueue.main.async {
            self.categories = sampleCategories
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = CategoryViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink(destination: SubcategoryListView(subcategories: category.subcategories)) {
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
            .task {
                await viewModel.fetchCategories()
            }
        }
    }
}

struct SubcategoryListView: View {
    let subcategories: [Subcategory]
    
    var body: some View {
        List(subcategories) { subcategory in
            NavigationLink(destination: ProductListView(products: subcategory.products)) {
                Text(subcategory.name)
            }
        }
        .navigationTitle("Subcategories")
    }
}

struct ProductListView: View {
    let products: [Product]
    
    var body: some View {
        List(products) { product in
            Text(product.name)
        }
        .navigationTitle("Products")
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
