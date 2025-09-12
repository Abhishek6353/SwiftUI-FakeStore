//
//  ProductListViewModel.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    
    
    func fetchProducts() {
        let url = URL(string: "https://fakestoreapi.com/products")!
        
        let urlSession = URLSession.shared
        
       let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                self.errorMessage = "Failed to fetch products: \(error.localizedDescription)"
                return
            }
            
            guard let data = data else {
                self.errorMessage = "No data returned from server."
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    self.products = data
                    self.errorMessage = nil
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode products: \(error.localizedDescription)"
                }
            }
        }
        
        task.resume()
        
    }
}

