import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignupViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isSignedUp = false
    private var authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signUp(name: String, email: String, password: String, confirmPassword: String) {
        errorMessage = nil
        guard !email.isEmpty else {
            errorMessage = "Email is required."
            return
        }
        guard InputValidator.isValidEmail(email) else {
            errorMessage = "Please enter a valid email address."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "Password is required."
            return
        }
        guard InputValidator.isValidPassword(password) else {
            errorMessage = "Password must be at least 8 characters, include uppercase, lowercase, digit, and special character."
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        isLoading = true
        authManager.createUser(name: name, email: email, password: password) { [weak self] error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error
                } else {
                    self?.isSignedUp = true
                }
            }
        }
    }
}
