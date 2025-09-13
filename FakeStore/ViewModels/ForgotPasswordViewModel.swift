//
//  ForgotPasswordView.swift
//  FakeStore
//
//  Created by Apple on 13/09/25.
//

import SwiftUI
import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isSuccess = false
    private var authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }

    func resetPassword(email: String) {
        errorMessage = nil
        isSuccess = false
        guard !email.isEmpty else {
            errorMessage = "Email is required."
            return
        }
        isLoading = true
        authManager.resetPassword(email: email) { [weak self] error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error
                } else {
                    self?.isSuccess = true
                }
            }
        }
    }
}
