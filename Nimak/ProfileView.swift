//
//  ProfileView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 13.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = "Александр"
    @State var phone: String = "+7 922 000 33 75"
    @State var spisok: [String] = ["Заказы", "Адреса доставки", "Способы оплаты", "Заключить договор" ]
    @State var returnOnHomeView: (() -> Void)? = nil
    init(name: String, phone: String, spisok: [String], returnOnHomeView: ( () -> Void)? = nil) {
        self.name = name
        self.phone = phone
        self.spisok = spisok
        self.returnOnHomeView = returnOnHomeView
    }
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Capsule()
                    .frame(width: 50, height: 30)
                    .opacity(0.2)
                    .overlay(
                    Image(systemName: "arrow.left")
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            VStack {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(phone)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .foregroundStyle(.black.opacity(0.4))
                
            }.padding(.horizontal, 16)
            ForEach(spisok, id: \.self) { item in
                VStack(alignment: .leading) {
                    Text(item)
                        .font(.headline)
                    .fontWeight(.bold)
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundStyle(.black.opacity(0.3))
                }
                .frame(height: 75)
               
                
                    
                    
                
            }
            
        }
    }
}

#Preview {
    ProfileView(name: "asdafs", phone: "21321312", spisok: ["12"])
}
