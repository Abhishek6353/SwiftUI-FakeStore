//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI

@main
struct FakeStoreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            if authManager.isLoggedIn {
                HomeView(authManager: authManager)
            } else {
                LoginView(authManager: authManager)
            }
        }
    }
}
