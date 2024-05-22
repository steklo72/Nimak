//
//  CategoryView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 20.05.2024.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

final class CategoryViewModel: ObservableObject {
    @Published var categoryArray: [CategoryMenu] = []

    let db = Firestore.firestore().collection("category")
    
    func getData() async {
        do {
            let data = try await db.getDocuments(as: CategoryMenu.self)
            
            
//            mainCategoriesRef.getDocuments { (snapshot, error) in
//                if let error = error {
//                    print("Error fetching main categories: \(error)")
//                } else if let snapshot = snapshot {
//                    let mainCategories = snapshot.documents.compactMap { document in
//                        try? document.data(as: MainCategory.self)
//                    }
//                    // Iterate over main categories and fetch subcategories
//                    for mainCategory in mainCategories {
//                        mainCategoriesRef.document(mainCategory.id).collection("subcategories").getDocuments { (snapshot, error) in
//                            if let error = error {
//                                print("Error fetching subcategories for main category \(mainCategory.id): \(error)")
//                            } else if let snapshot = snapshot {
//                                mainCategory.subcategories = snapshot.documents.compactMap { document in
//                                    try? document.data(as: Subcategory.self)
//                                }
//                            }
//                        }
//                    }
//                }
//            }

            
            db.getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error fetching main categories: \(error)")
                } else if let snapshot = snapshot {
                    var mainCategories = snapshot.documents.compactMap { document in
                        try? document.data(as: CategoryMenu.self)
                    }
                    // Iterate over main categories and fetch subcategories
                    for item in mainCategories {
                        self.db.document(item.id).collection("podcategory").getDocuments { (snapshot, error) in
                            if let error = error {
                                print("Error fetching subcategories for main category \(item.id): \(error)")
                            } else if let snapshot = snapshot {
                                self.categoryArray = snapshot.documents.compactMap { document in
                                    try? document.data(as: CategoryMenu.self)
                                }
                            }
                        }
                    }
                }
            }

//
            self.categoryArray = data
        } catch {
            print("пошел нахуй")
        }
    }
}

struct CategoryView: View {
    @StateObject var vm = CategoryViewModel()
    
    var body: some View {
        List {
            ForEach(vm.categoryArray) { category in
                Text(category.name)
                
            }
        }
        .task {
            await vm.getData()
        }
    }
}

#Preview {
    CategoryView()
}
