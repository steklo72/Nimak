//
//  ProductView.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 06.08.2024.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        TabView{
            Text("Главная").tabItem { HStack {
                Image(systemName: "house")
                Text("Главная")
            } }.tag(0)
            CategoryList().tabItem { HStack {
                Image(systemName: "book.pages")
                Text("Каталог")
            } }.tag(1)
            Text("Здесь будет корзина").tabItem { HStack {
                Image(systemName: "cart")
                Text("Корзина")
            } }.tag(2)
            ProfileView(name: "Aleks", phone: "89922332", spisok: ["Заказы", "Адреса доставки", "Способы оплаты", "Заключить договор" ]).tabItem { HStack {
                Image(systemName: "person")
                Text("Профиль")
            } }.tag(3)
        }
    }
}

#Preview {
    ProductView()
}
