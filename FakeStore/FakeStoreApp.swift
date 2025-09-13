//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Apple on 12/07/25.
//

import SwiftUI
import FirebaseCore

@main
struct FakeStoreApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
