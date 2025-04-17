//
//  AuthViewModel.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import Firebase
import GoogleSignIn
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var authError: String?
    
    init() {
        self.user = Auth.auth().currentUser
        self.isAuthenticated = user != nil
    }
    
    func signUpWithEmail(email: String, password: String, firstName: String, lastName: String) {
        authError = nil
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.authError = error.localizedDescription
                return
            }
            
            self?.user = result?.user
            self?.isAuthenticated = true
            
            if let userId = result?.user.uid {
                self?.storeUserNameInFirestore(userId: userId, firstName: firstName, lastName: lastName)
            }
        }
    }
    
    func storeUserNameInFirestore(userId: String, firstName: String, lastName: String) {
        guard !firstName.isEmpty, !lastName.isEmpty else {
            self.authError = "First name and last name cannot be empty."
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userId)
        
        guard let email = user?.email else {
            self.authError = "Email is missing. Please check your authentication details."
            return
        }
        
        userRef.setData([
            "firstName": firstName,
            "lastName": lastName,
            "email": email
        ]) { [weak self] error in
            if let error = error {
                self?.authError = "Error saving user data: \(error.localizedDescription)"
            } else {
                print("User data saved successfully!")
            }
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
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
            self.isAuthenticated = false
            
            if GIDSignIn.sharedInstance.currentUser != nil {
                GIDSignIn.sharedInstance.signOut()
            }
        } catch {
            self.authError = error.localizedDescription
        }
    }
}
