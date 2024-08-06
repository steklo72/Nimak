//
//  ProductManager.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProductsManager {
    
    static let shared = ProductsManager()
    
    
    private let productsCollection = Firestore.firestore().collection("products")
    private let recipesCollection = Firestore.firestore().collection("recipes")
    
    private func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    private func recipeDocument(recipeId: String) -> DocumentReference {
        recipesCollection.document(recipeId)
    }
    func uploadRecipe(recipe: Recipe) async throws {
        try recipeDocument(recipeId: String(recipe.id)).setData(from: recipe, merge: false)
    }
    
    func uploadProduct(product: Product) async throws {
        try productDocument(productId: String(product.id)).setData(from: product, merge: false)
    }
}
