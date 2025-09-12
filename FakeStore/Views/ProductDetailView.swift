//
//  ProductDetailView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Image
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 100, height: 100)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                // Title
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                // Price + Rating
                HStack {
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(product.rating.rate, specifier: "%.1f")")
                            .font(.subheadline)
                    }
                }
                
                Divider()
                
                // Description
                Text("Description")
                    .font(.headline)
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ProductDetailView(product: Product(id: 0, title: "Title", price: 12.0, description: "Description", category: "category", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 4.2, count: 1)))
//}
