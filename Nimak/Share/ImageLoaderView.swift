//
//  ImageLoaderView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 13.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var imageName: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    var body: some View {
        VStack {
            Rectangle()
                .opacity(0.001)
                .overlay (
                    WebImage(url: URL(string: imageName))
                        .resizable()
                        .aspectRatio(contentMode: resizingMode)
                        .allowsHitTesting(false)
                    
                )
                .clipped()
        }
    }
}

#Preview {
    ImageLoaderView()
        .padding(40)
    .padding(.vertical, 60)
}
