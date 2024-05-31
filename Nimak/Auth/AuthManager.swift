//
//  AuthManager.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 31.05.2024.
//

import SwiftUI
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    let phoneNumber: String?
    let isAnonymous: Bool
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
        self.phoneNumber = user.phoneNumber
        self.isAnonymous = user.isAnonymous
        
    }
    
    
}
enum AuthProviderOption: String {
    case email = "password"
    case google = "google.com"
    case apple = "apple.com"
}

final class AuthManager {
    static let shared = AuthManager()
    
    func getAuthenicatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.delete()
    }
    
    // Поставщики входа
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        var providers: [AuthProviderOption] = []
        for provider in providerData {
//            print(provider.providerID)
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found\(provider.providerID)")
            }
        }
        return providers
    }
    
    
    
    
}

//MARK: Авторизация через Email
extension AuthManager {
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
        
    }
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await user.updatePassword(to: password)
    }
    //MARK: потом открорректировать
//    func updateEmail(email: String) async throws {
//        guard let user = Auth.auth().currentUser else  {
//            throw URLError(.badServerResponse)
//        }
//        try await user.updateEmail(to: email)
//    }
}
