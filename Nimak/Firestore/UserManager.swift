//
//  UserManager.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 09.06.2024.
//

import Foundation

struct DBUser: Codable {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dataCreated: Date?
    let profileImagePath: String?
    let profileImagePathUrl: String?
    let age: Int?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dataCreated = Date()
        self.profileImagePath = nil
        self.profileImagePathUrl = nil
        self.age = nil
    }
   
    
    
}
