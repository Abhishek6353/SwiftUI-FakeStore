//
//  ForgotPasswordView.swift
//  FakeStore
//
//  Created by Apple on 13/09/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var authManager: AuthManager
    @State private var email: String = ""
    @StateObject private var viewModel: ForgotPasswordViewModel
    @Environment(\.dismiss) private var dismiss

    init(authManager: AuthManager) {
        self.authManager = authManager
        _viewModel = StateObject(wrappedValue: ForgotPasswordViewModel(authManager: authManager))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                Image(systemName: "cart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 8)
                Text("Forgot Password")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Enter your email to receive a reset link")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                if viewModel.isLoading {
                    ProgressView()
                }
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .lineLimit(2)
                }
                if viewModel.isSuccess {
                    Text("Reset link sent! Check your email.")
                        .foregroundColor(.green)
                        .font(.footnote)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                dismiss()
                            }
                        }
                }
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    viewModel.resetPassword(email: email)
                }) {
                    Text("Send Reset Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.top, 8)
                Spacer()
                HStack {
                    Text("Remember your password?")
                        .font(.footnote)
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Login")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                    }
                }
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 24)
            .background(Color(.systemBackground))
        }
    }
}

#Preview {
    ForgotPasswordView(authManager: AuthManager())
}
