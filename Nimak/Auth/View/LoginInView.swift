//
//  LoginInView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 03.06.2024.
//

import SwiftUI

struct LoginInView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            Text("Доброе пожаловать!")
                .font(.title)
                .fontWeight(.semibold)
        }
        
        
    }
}

#Preview {
    LoginInView()
}
