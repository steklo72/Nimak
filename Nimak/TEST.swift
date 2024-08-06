//
//  TEST.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 21.05.2024.
//

//import SwiftUI
//import FirebaseFirestore
//
//final class TestViewModel: ObservableObject {
//    @Published var categoryArray: [Category] = []
//    
//}
//
//struct CategoryListView: View {
//    @State var categories: [Category] = []
//    @StateObject var vm = TestViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            List(categories) { category in
//                NavigationLink(destination: SubcategoryListView(categoryId: category.id)) {
//                    Text(category.name)
//                }
//            }
//            .onAppear {
//                loadCategories()
//            }
//        }
//        
//    }
//
//    func loadCategories() {
//        let db = Firestore.firestore()
//        db.collection("category").getDocuments { snapshot, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let snapshot = snapshot {
//                categories = snapshot.documents.compactMap { document -> Category? in
//                    try? document.data(as: Category.self)
//                }
//            }
//        }
//    }
//}
//
//
//struct SubcategoryListView: View {
//    var categoryId: String
//    @State var podcategory: [Subcategory] = []
//
//    var body: some View {
//        NavigationStack {
//            List(podcategory) { products in
//                NavigationLink(destination: TestProductListView(podcategoryId: products.id)) {
//                    Text(products.name)
//                }
//
//            }
//            .onAppear {
//                loadSubcategories()
//        }
//        }
//        
//    }
//
//    func loadSubcategories() {
//        let db = Firestore.firestore()
//        
//        db.collection("podcategory").whereField("parentid", isEqualTo: categoryId).getDocuments { snapshot, error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    
//                } else if let snapshot = snapshot {
//                    // Display subcategories in the list
////                    podcategory = snapshot.documents.compactMap { document -> Subcategory? in
////                            try? document.data(as: Subcategory.self)
////                        
////                    }
//                    print(podcategory)
//                    for document in snapshot.documents {
//  
//                        let subcategory = try? document.data(as: Subcategory.self)
//                        if let subcategory = subcategory {
//                            
//                            print(subcategory)
//                            podcategory.append(subcategory)
//                            
//                        }
////                        print(podcategory)
//                    }
//                }
//            }
//    }
//}
//struct TestProductListView: View {
//    var podcategoryId: String
//    @State var testProducts: [TestProduct] = []
//    
//    var body: some View {
//        List {
//            ForEach(testProducts) { product in
//                Text(product.id)
//                
//            }
//            .onAppear {
//                loadTestProduct()
//            }
//        }
//        
//    }
//    func loadTestProduct() {
//        let db = Firestore.firestore()
//        db.collection("testproduct").whereField("categoryId", isEqualTo: podcategoryId).getDocuments { snapshot, error in
//            if let error = error {
//                print("HUYNA")
//            } else if let snapshot = snapshot {
//                print(testProducts)
//                for document in snapshot.documents {
//                    let testproduct = try? document.data(as: TestProduct.self)
//                    if let testproduct = testproduct {
//                        print(testproduct)
//                        testProducts.append(testproduct)
//                    }
//                }
//            }
//        }
//    }
//}
//
////            .whereField("parentid", isEqualTo: categoryId)
//
//struct Category: Identifiable, Codable {
//    var id: String
//    var name: String
//    var subcategories: [Subcategory]
//}
//
//struct Subcategory: Identifiable, Codable {
//    var id: String
//    var name: String
//    var parentid: String
//    var products: [TestProduct]
//}
//
//struct TestProduct: Identifiable, Codable {
//    var id: String
//    var categoryId: String
//    
//}
//
//
//
//#Preview {
//    CategoryListView()
//}
