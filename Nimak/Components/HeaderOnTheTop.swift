//
//  HeaderOnTheTop.swift
//  Nimak
//
//  Created by Fedotov Aleksandr on 10.05.2024.
//

import SwiftUI

struct HeaderOnTheTop: View {
    @State var address: String = "Адресс доставки"
    var iconProfile: String = "person"
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                Text(address)
                    .font(.headline)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: iconProfile)
                .font(.title2)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HeaderOnTheTop()
}
