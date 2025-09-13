//
//  HomeView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authManager: AuthManager
    @StateObject private var productViewModel = ProductListViewModel()
    @State private var showLogoutAlert = false
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showLogoutAlert = true
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .onAppear {
                productViewModel.fetchProducts()
            }
            .alert("Are you sure you want to logout?", isPresented: $showLogoutAlert) {
                Button("Logout", role: .destructive) {
                    authManager.logout()
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
