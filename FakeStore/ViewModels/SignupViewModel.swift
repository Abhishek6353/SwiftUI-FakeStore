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
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "All fields are required."
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
