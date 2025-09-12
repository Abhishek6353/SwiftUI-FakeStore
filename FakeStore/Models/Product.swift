//
//  Product.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
