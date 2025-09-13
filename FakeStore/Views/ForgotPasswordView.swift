//
//  ForgotPasswordView.swift
//  FakeStore
//
//  Created by Apple on 13/09/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    var body: some View {
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
            Button(action: {
                // Handle send reset link action
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
                    // Handle navigation to login
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

#Preview {
    ForgotPasswordView()
}
