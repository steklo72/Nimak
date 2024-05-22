//
//  RecipeViewCell.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 16.05.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import SDWebImage
import SDWebImageSwiftUI




final class RecipeViewModel: ObservableObject {
    @Published var arrayRecipe: [Recipe] = []
    let db = Firestore.firestore().collection("recipes")
    
    func getData() async {
        do {
            let data = try await db.getDocuments(as: Recipe.self)
            self.arrayRecipe = data
            
            
        } catch {
            print("error")
        }
        
    }
}




struct RecipeViewCell: View {
    @StateObject var vm = RecipeViewModel()
    var body: some View {
        List {
            ForEach(vm.arrayRecipe) { item in
                HStack {
                    ImageLoaderView(imageName: item.image)
                        .frame(width: 70, height: 70)
                    Text(item.name)
                }
                
            }
        }
        .task {
            await vm.getData()
        }
    }
}

#Preview {
    RecipeViewCell()
}
