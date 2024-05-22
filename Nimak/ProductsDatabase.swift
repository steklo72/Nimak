//
//  Utilinies.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
//    let total, skip, limit: Int
}

struct SliderItem: Identifiable, Codable, Equatable {
    var id: String
    var title: String
    var image: String
    var description: String?
    
}
struct Product: Identifiable, Codable, Equatable {
    let id: Int
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Double?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}
struct RecipeArray: Codable {
    let recipes: [Recipe]
    let total, skip, limit: Int
}

// MARK: - Recipe
struct Recipe: Identifiable,Codable, Equatable {
    let id: Int
    let name: String
    let ingredients, instructions: [String]
    let prepTimeMinutes, cookTimeMinutes, servings: Int
    let difficulty: Difficulty
    let cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let userID: Int
    let image: String
    let rating: Double
    let reviewCount: Int
    let mealType: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, ingredients, instructions, prepTimeMinutes, cookTimeMinutes, servings, difficulty, cuisine, caloriesPerServing, tags
        case userID = "userId"
        case image, rating, reviewCount, mealType
    }
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
}


struct NimakProduct {
    let id: String  // id в программе
    let name: String // имя в программе
    let art: String // Артикул в программе
    let kodName: String //  код  в программе
    let shtrichKod: Int //  Штрихкод
    let category: String
    let description: String
    let creator: String
    let brand: String
    let unitStorage: String
    let cost: Double
    let stock: Int
    
    
}
struct CategoryMenu: Identifiable,Codable {
    let id: String
    let name: String
    var subcategory: [SubCategory]?
//    enum CodingKeys: String, CodingKey {
//        case id, name, subcategory
//    
//    }
//    static func ==(lhs: CategoryMenu, rhs: CategoryMenu) -> Bool {
//        return lhs.id == rhs.id
//    }
}
struct ArrayCategory {
    let categories: [CategoryMenu]
}
struct SubCategory: Identifiable, Codable {
    var id: String
    var name: String
    
    
}



