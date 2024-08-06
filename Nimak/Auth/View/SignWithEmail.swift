//
//  SignWithEmail.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 03.06.2024.
//

import SwiftUI
@MainActor
final class SignWithEmailView: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("no email is found")
            return
        }
        try await AuthManager.shared.signInUser(email: email, password: password)
    }
}
struct SignWithEmail: View {
    @StateObject var vm = SignWithEmailView()
    
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7).ignoresSafeArea()
            VStack {
                Capsule(style: .continuous)
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.white)
                    .overlay(Text("Добро пожаловать").foregroundStyle(.blue).fontWeight(.bold))
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .overlay( TextField("Адресс электронной почты", text: $vm.email)
                        .padding()
                        .cornerRadius(10))
                    .padding(.horizontal, 10)
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .overlay(  SecureField("Введите пароль", text: $vm.password).padding())
                    .padding(.horizontal, 10)
                
                Button {
                    // login
                } label: {
                    Capsule(style: .continuous)
                        .frame(width: 250, height: 50)
                        .foregroundStyle(.white)
                        .overlay(Text("Войти").font(.headline))
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Забыли пароль?")
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    Button {
                       
                    } label: {
                        Text("Регистрация")
                            .fontWeight(.bold)
                    }.frame(maxWidth: .infinity)

                }
                .background(.red)
                .padding(30)
                .foregroundStyle(.white)
                

            }
        }
        
    }
}

#Preview {
    SignWithEmail()
}
