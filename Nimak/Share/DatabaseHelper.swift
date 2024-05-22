//
//  DatabaseHelper.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 13.05.2024.
//

import Foundation

struct DatabaseHelper {
    func getAllRecipe() async throws -> [Recipe] {
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
        return recipes.recipes
        
    }
}
