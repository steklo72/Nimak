//
//  DownloadManagerProduct.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProductDownloadViewModel: ObservableObject {
    
//    let db = Firestore.firestore()
    
    func downloadProductsAndUploadToFirebase()  {
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        Task {

            do {
                let (data,_) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode(ProductArray.self, from: data)
                let productArray = products.products
                for product in productArray {
                    try? await ProductsManager.shared.uploadProduct(product: product)
                    print("Success")
                    print(products.products.count)
                }
            } catch {
                print("error")
            }
        }
    }
    func getAllRecipe() {
        Task {
            do {
                guard let url = URL(string: "https://dummyjson.com/recipes") else {
                    throw URLError(.badURL)
                }
                let (data,_) = try await URLSession.shared.data(from: url)
                let recipes = try JSONDecoder().decode(RecipeArray.self, from: data)
                let recipesArray = recipes.recipes
                for recipe in recipesArray {
                    try? await ProductsManager.shared.uploadRecipe(recipe: recipe)
                    print("Success")
                    print(recipes.recipes.count)
                }
//                return recipes.recipes
            } catch {
                print("error")
            }
        }
       
        
    }
}
