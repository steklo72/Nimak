//
//  Catalog.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 30.07.2024.
//

import SwiftUI
import FirebaseFirestore

final class CatalogViewModel: ObservableObject {
    @Published var category: [Category] = []
}

struct CatalogView: View {
    @State var category: [String] = []
    @StateObject var vm = CatalogViewModel()
    var body: some View {
        Text("hello")
    }
}
