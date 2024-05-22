//
//  SliderOnTheHome.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import SwiftUI

final class SliderOnTheHomeViewModel: ObservableObject {
    @Published private var sliderItems: [SliderItem] = []
    @Published var title: String = "Title"
    @Published var backgroundPressed: (() -> Void)?
    
    
}


struct SliderOnTheHome: View {
//    @State private var imageName: String
    @StateObject var viewModel = SliderOnTheHomeViewModel()
    @State var scrollPosition: Int? = 1
    
    @StateObject var viewModelRecipe = RecipeViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 4) {
                ForEach(viewModelRecipe.arrayRecipe) { index in
                    ZStack {
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 380,height: 400)
                            .overlay {
                                ImageLoaderView(imageName: index.image)
                            }
                        .cornerRadius(20)
//                        Text(viewModel.title)
                    }
                        
                    
                }
            }
            .task {
                await viewModelRecipe.getData()
            }
            .padding(4)
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    .scrollBounceBehavior(.basedOnSize)
    .scrollPosition(id: $scrollPosition, anchor: .center)
    .animation(.easeIn, value: scrollPosition)
    .scrollIndicators(.hidden)
    }
}

#Preview {
    SliderOnTheHome()
}
