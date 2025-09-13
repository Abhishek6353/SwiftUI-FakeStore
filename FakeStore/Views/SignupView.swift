//
//  SignupView.swift
//  FakeStore
//
//  Created by Apple on 13/09/25.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSecure: Bool = true
    @State private var isConfirmSecure: Bool = true
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
                .padding(.bottom, 8)
            Text("Create your account")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Sign up to start shopping")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 16)
            VStack(spacing: 16) {
                TextField("Name", text: $name)
                    .autocapitalization(.words)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
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
                ZStack(alignment: .trailing) {
                    if isConfirmSecure {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    } else {
                        TextField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    Button(action: { isConfirmSecure.toggle() }) {
                        Image(systemName: isConfirmSecure ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(.trailing, 12)
                    }
                }
            }
            Button(action: {
                // Handle sign up action
            }) {
                Text("Sign Up")
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
                Text("Already have an account?")
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
    SignupView()
}
