//
//  AsyncImageView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 20.05.2024.
//

import SwiftUI

struct AsyncImageView: View {
    @State private var imageName: String = Constants.randomImage
    
    var body: some View {
        AsyncImage(url: URL(string: imageName)) { image in
            switch image {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure(let error):
                Image(systemName: "xmark")
            }
            
        }
    }
}

#Preview {
    AsyncImageView()
}
