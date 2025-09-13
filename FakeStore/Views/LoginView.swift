//
//  ContentView.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var showSignup: Bool = false
    @State private var showForgotPassword: Bool = false
    @ObservedObject var authManager: AuthManager
    @StateObject private var viewModel: LoginViewModel
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        _viewModel = StateObject(wrappedValue: LoginViewModel(authManager: authManager))
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
                Text("Welcome to Fakestore")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Sign in to continue shopping")
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
                    ZStack(alignment: .trailing) {
                        if isSecure {
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                        } else {
                            TextField("Password", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                        }
                        Button(action: { isSecure.toggle() }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding(.trailing, 12)
                        }
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                Button(action: {
                    viewModel.login(email: email, password: password)
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.top, 8)
                Button(action: {
                    showForgotPassword = true
                }) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .foregroundColor(.accentColor)
                }
                Spacer()
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Button(action: {
                        showSignup = true
                    }) {
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                    }
                }
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 24)
            .background(Color(.systemBackground))
            .navigationDestination(isPresented: $showSignup) {
                SignupView(authManager: authManager)
            }
            .navigationDestination(isPresented: $showForgotPassword) {
                ForgotPasswordView(authManager: authManager)
            }
        }
    }
}

#Preview {
    LoginView(authManager: AuthManager())
}
