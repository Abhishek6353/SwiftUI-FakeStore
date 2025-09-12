//
//  ProductRowView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

import SwiftUI

struct ProductRowView: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }

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
