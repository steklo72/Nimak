//
//  SignInWithPhoneView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 05.06.2024.
//

import SwiftUI
@MainActor
final class SignInPhoneView: ObservableObject {
    @Published var phoneNumber: String = ""
}

struct SignInWithPhoneView: View {
    
    @StateObject private var viewModel = SignInPhoneView()
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
                        Capsule()
                        
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .foregroundStyle(.black.opacity(0.2))
                        HStack {
                            Text("+7")
                                
                            .offset(x: 15)
                            TextField("номер телефона", text: $viewModel.phoneNumber).offset(x: 25)
                        }
                        .font(.title)
                        
                            
                    }
                    Button {
                        
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .foregroundStyle(Color.blue.opacity(0.2))
                            Text("Войти по номеру телефона")
                                .font(.headline)
                        }
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
