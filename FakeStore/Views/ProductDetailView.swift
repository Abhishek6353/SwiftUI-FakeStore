import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Product Image
                    WebImage(url: URL(string: product.image))
                        .resizable()
                        .indicator(.activity)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                        .shadow(radius: 8)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    // MARK: - Title & Price
                    VStack(alignment: .leading, spacing: 12) {
                        Text(product.title)
                            .font(.title2.bold())
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("\(product.rating.rate, specifier: "%.1f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("(\(product.rating.count))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // MARK: - Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.headline)
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 80) // for button space
                }
            }
            
            // MARK: - Add to Cart Button
//            VStack {
//                Button(action: {
//                    // Handle Add to Cart
//                }) {
//                    HStack {
//                        Image(systemName: "cart.fill.badge.plus")
//                        Text("Add to Cart")
//                            .fontWeight(.semibold)
//                    }
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(15)
//                    .shadow(radius: 5)
//                }
//            }
//            .padding()
//            .background(.ultraThinMaterial)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
