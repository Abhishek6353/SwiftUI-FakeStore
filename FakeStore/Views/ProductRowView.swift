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
        HStack(alignment: .center, spacing: 15) {
            
            // MARK: - Product Image
            WebImage(url: URL(string: product.image))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .shadow(radius: 2)
            
            // MARK: - Product Info
            VStack(alignment: .leading, spacing: 6) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                HStack {
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.subheadline.bold())
                        .foregroundColor(.green)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        Text("\(product.rating.rate, specifier: "%.1f")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                Text(product.category.capitalized)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

//#Preview {
//    ProductRowView()
//}
