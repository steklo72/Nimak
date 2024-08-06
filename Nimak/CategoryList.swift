//
//  CategoryList.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 05.08.2024.
//

import SwiftUI

import FirebaseFirestore
final class CategoryListViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var subcategory: [Subcategory] = []
    @Published var testproducts: [TestProduct] = []
    
    let db = Firestore.firestore()
    
    func fetchCategory() {
        db.collection("category").getDocuments() { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let snapshot = snapshot {
                self.categories = snapshot.documents.compactMap { document -> Category? in
                    try? document.data(as: Category.self)
                }
            }
        }
    }
    func fetchSubCategory(for subcategoryId: String) {
        db.collection("podcategory").getDocuments() { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let snapshot = snapshot {
               
                let array = snapshot.documents.compactMap {document -> Subcategory? in
                    try? document.data(as: Subcategory.self)
                    }
                self.subcategory = array.filter { $0.parentid == subcategoryId }
                
            }
        }
    }
    func fetchProducts(for productsId: String) {
        db.collection("testproduct").getDocuments() { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let snapshot = snapshot {
                let array = snapshot.documents.compactMap {document -> TestProduct? in
                    try? document.data(as: TestProduct.self)
                    }
                self.testproducts = array.filter { $0.subcategoryId == productsId}
            }
            
        }
    }
}

struct CategoryList: View {
    @StateObject var viewModel = CategoryListViewModel()
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()) ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.categories) { category in
                        NavigationLink(destination: SubCategoryList(categoryId: category.id)) {
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 150, height: 150)
                                    .opacity(0.3)
                                    .padding()
                                Text(category.name)
                            }
                            
                        }
                        
                    }
                    
                })
            }
            .onAppear {
                 viewModel.fetchCategory()
            }
            
        }
        
    }
}
struct SubCategoryList: View {
    let categoryId: String
    @StateObject var vm =  CategoryListViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.subcategory) { subcategory in
                NavigationLink(destination: ProductListView(subcategoryId: subcategory.id)) {
                    Text(subcategory.name)
                }
                
            }
            .onAppear {
                vm.fetchSubCategory(for: categoryId)
               
            }
        }
        
    }
}

struct ProductListView: View {
    let subcategoryId: String
    @StateObject var vm = CategoryListViewModel()
    var body: some View {
        NavigationStack {
            List(vm.testproducts) { product in
                Text(product.name)
            }
            .onAppear {
                vm.fetchProducts(for: subcategoryId)
            }
        }
        
    }
}

struct Category: Identifiable, Codable {
    let id: String
    let name: String
   
}
struct Subcategory: Identifiable, Codable {
    let id: String
    let name: String
    let parentid: String
}
struct TestProduct: Identifiable, Codable {
    let id: String
    let name: String
    let subcategoryId: String
}

#Preview {
    CategoryList()
}
