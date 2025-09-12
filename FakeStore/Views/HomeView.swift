//
//  HomeView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//
    
import SwiftUI

struct HomeView: View {

    @StateObject private var productViewModel = ProductListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if let error = productViewModel.errorMessage {
                    ErrorView(message: error)
                } else {
                    List(productViewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductRowView(product: product)
                        }
                        .listRowSeparator(.visible)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Products")
            .onAppear {
                productViewModel.fetchProducts()
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
