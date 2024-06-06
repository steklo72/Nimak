//
//  SignInWithPhoneView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 05.06.2024.
//

import SwiftUI

struct SignInWithPhoneView: View {
    var body: some View {
        NavigationStack {
            VStack{
                ZStack {
                    Text("Вход")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Circle()
                        .overlay(Image(systemName: "xmark").foregroundStyle(.black))
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.black.opacity(0.2))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                        .padding(.trailing, 50)
                    
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("Введите номер телефона")
                        .font(.title3)
                        .fontWeight(.medium)
                        .offset(x: 15)
                    ZStack(alignment: .leading) {
                        Text("+7 922 000 33 75")
                            .font(.title)
                            .offset(x: 15)
                        Capsule()
                        
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .foregroundStyle(.black.opacity(0.2))
                            
                    }
                    
                }
                .padding(30)
            }
            Spacer()
            
        }
    }
}

#Preview {
    SignInWithPhoneView()
}
