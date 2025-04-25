//
//  AuthViewModel.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import Firebase
import GoogleSignIn
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var authError: String?
    @Published var userModel: UserModel?
    @Published var didCompleteBiometricAuth: Bool = false


    init() {
        self.user = Auth.auth().currentUser
        self.isAuthenticated = user != nil

        if isAuthenticated {
            fetchUserData()
        }
    }

    func signUpWithEmail(
        email: String,
        password: String,
        firstName: String,
        lastName: String,
        completion: @escaping (Bool) -> Void
    ) {

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in

            if let error = error {
                self?.authError = error.localizedDescription
                completion(false)
                return
            }

            guard let user = result?.user else {
                self?.authError = "No user returned"
                completion(false)
                return
            }

            self?.user = user

            self?.storeUserNameInFirestore(userId: user.uid, firstName: firstName, lastName: lastName, email: email) { success in
                self?.isAuthenticated = success
                completion(success)
            }
        }
    }

    func storeUserNameInFirestore(userId: String, firstName: String, lastName: String, email: String, completion: @escaping (Bool) -> Void) {
        guard !firstName.isEmpty, !lastName.isEmpty else {
            self.authError = "First name and last name cannot be empty."
            completion(false)
            return
        }

        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId)

        userRef.setData([
            "firstName": firstName,
            "lastName": lastName,
            "email": email
        ]) { [weak self] error in
            if let error = error {
                self?.authError = "Error saving user data: \(error.localizedDescription)"
                print("Error saving user data: \(error.localizedDescription)")
                completion(false)
            } else {
                print("User data saved successfully!")
                completion(true)
            }
        }
    }

    func fetchUserData() {
        guard let userId = user?.uid else {
            self.authError = "User not logged in."
            return
        }

        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId)

        userRef.getDocument { [weak self] document, error in
            if let error = error {
                self?.authError = "Failed to fetch user: \(error.localizedDescription)"
                return
            }

            guard let data = document?.data() else {
                self?.authError = "No user data found."
                return
            }

            self?.userModel = UserModel(id: userId, data: data)
        }
    }

    func loginWithEmail(email: String, password: String) {
        authError = nil
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.authError = error.localizedDescription
                return
            }

            self?.user = result?.user
            self?.isAuthenticated = true
            self?.fetchUserData()
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
            self.isAuthenticated = false
            self.userModel = nil

            if GIDSignIn.sharedInstance.currentUser != nil {
                GIDSignIn.sharedInstance.signOut()
            }
        } catch {
            self.authError = error.localizedDescription
        }
    }
}
