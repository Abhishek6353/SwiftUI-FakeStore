import Foundation

struct User: Identifiable, Codable {
    var id: String { uid }
    let uid: String
    let name: String
    let email: String
}
