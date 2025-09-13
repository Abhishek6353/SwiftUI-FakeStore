//
//  ProductRowView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            WebImage(url: URL(string: product.image))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 6) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)

                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(product.category.capitalized)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    ProductRowView()
//}
