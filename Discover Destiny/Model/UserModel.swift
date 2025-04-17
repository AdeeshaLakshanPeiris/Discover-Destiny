////
////  UserModel.swift
////  Discover Destiny
////
////  Created by Guest User on 2025-04-12.
////
//
import Foundation
import FirebaseAuth

struct UserModel: Identifiable, Codable {
    let id: String
    let email: String?
    let displayName: String?
    let photoURL: URL?

    init(from user: User) {
        self.id = user.uid
        self.email = user.email
        self.displayName = user.displayName
        self.photoURL = user.photoURL
    }
}
