//
//  ErrorView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
            Text(message)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    ErrorView(message: "An error occurred while fetching products.")
}
