import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
    }
    
    func login(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error.localizedDescription)
                } else {
                    self?.isLoggedIn = true
                    completion(nil)
                }
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
        } catch {
            // Handle error if needed
        }
    }
    
    func createUser(name: String, email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error.localizedDescription)
                    return
                }
                guard let user = result?.user else {
                    completion("Failed to create user.")
                    return
                }
                let userData: [String: Any] = [
                    "uid": user.uid,
                    "name": name,
                    "email": email
                ]
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData(userData) { err in
                    if let err = err {
                        completion(err.localizedDescription)
                    } else {
//                        self?.isLoggedIn = true
                        completion(nil)
                    }
                }
            }
        }
    }
    
    func resetPassword(email: String, completion: @escaping (String?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error.localizedDescription)
                } else {
                    completion(nil)
                }
            }
        }
    }
}
