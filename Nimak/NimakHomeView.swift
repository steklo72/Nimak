//
//  NimakHomeView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import SwiftUI

struct NimakHomeView: View {
    @State private var scrollViewOffset: CGFloat = 0
    @State private var address: String = "Аккумуляторная 1"
 

    @StateObject var vm = ProductDownloadViewModel()
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.black.opacity(0.8).ignoresSafeArea()
            VStack {
                header
                    .padding(.horizontal, 10)
                    .foregroundStyle(.white)
                ScrollView(.vertical) {
                    SliderOnTheHome()
                    
//                    Button("Action") {
////                        vm.getAllRecipe()
////                        vm.downloadProductsAndUploadToFirebase()
//                    }
                }
               
               
            }
            
            
                
            
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "person")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
//                .fontWeight(.bold)
                .onTapGesture {
//                    ProfileView(name: "Aleksndr", phone: "+ 7 922 000 33 75", spisok: ["ss"], returnOnHomeView: nil)
                }
            HStack(spacing: 16) {
                Image(systemName: "arrow.down")
                    .onTapGesture {
                        
                    }
                Text(address)
                    .lineLimit(1)
                    .onTapGesture {
                        
                    }
                
            }
              
        }
    }
}

#Preview {
    NimakHomeView()
}
