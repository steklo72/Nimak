//
//  TEST.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 21.05.2024.
//

import SwiftUI
import FirebaseFirestore

final class TestViewModel: ObservableObject {
    @Published var categoryArray: [Category] = []
    
    
    
}

struct CategoryListView: View {
    @State var categories: [Category] = []
    @StateObject var vm = TestViewModel()
    
    var body: some View {
        NavigationStack {
            List(categories) { category in
                NavigationLink(destination: SubcategoryListView(categoryId: category.id)) {
                    Text(category.name)
                }
            }
            .onAppear {
                loadCategories()
            }
        }
        
    }

    func loadCategories() {
        let db = Firestore.firestore()
        db.collection("category").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let snapshot = snapshot {
                categories = snapshot.documents.compactMap { document -> Category? in
                    try? document.data(as: Category.self)
                }
            }
        }
    }
}


struct SubcategoryListView: View {
    var categoryId: String
    @State var podcategory: [Subcategory] = []

    var body: some View {
        NavigationStack {
            List {
//                Text("Subcategories for \(categoryId)")
                // Fetch subcategories for the given categoryId
                ForEach(podcategory) { item in
                    Text(item.name)
                    
                }
                
                
                
            }/*.toolbar(.hidden, for: .navigationBar)*/
            .onAppear {
                loadSubcategories()
        }
        }
        
    }

    func loadSubcategories() {
        let db = Firestore.firestore()
        
        db.collection("podcategory").whereField("parentid", isEqualTo: categoryId).getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                    
                } else if let snapshot = snapshot {
                    // Display subcategories in the list
//                    podcategory = snapshot.documents.compactMap { document -> Subcategory? in
//                            try? document.data(as: Subcategory.self)
//                        
//                    }
                    print(podcategory)
                    for document in snapshot.documents {
  
                        let subcategory = try? document.data(as: Subcategory.self)
                        if let subcategory = subcategory {
                            
                            print(subcategory)
                            podcategory.append(subcategory)
                            
                        }
//                        print(podcategory)
                    }
                }
            }
    }
}

//            .whereField("parentid", isEqualTo: categoryId)

struct Category: Identifiable, Codable {
    var id: String
    var name: String
}

struct Subcategory: Identifiable, Codable {
    var id: String
    var name: String
    var parentid: String
}



#Preview {
    CategoryListView()
}
