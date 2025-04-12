////
////  AuthViewModel.swift
////  Discover Destiny
////
////  Created by Guest User on 2025-04-12.
////
//
//import Firebase
//import GoogleSignIn
//import FirebaseAuth
//
//class AuthViewModel: ObservableObject {
//    @Published var user: User?
//    @Published var isAuthenticated = false
//    @Published var authError: String?
//
//    init() {
//        self.user = Auth.auth().currentUser
//        self.isAuthenticated = user != nil
//    }
//
//    // MARK: - Email Sign Up
//    func signUpWithEmail(email: String, password: String) {
//        authError = nil
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//            if let error = error {
//                self?.authError = error.localizedDescription
//                return
//            }
//
//            self?.user = result?.user
//            self?.isAuthenticated = true
//        }
//    }
//
//    // MARK: - Email Login
//    func loginWithEmail(email: String, password: String) {
//        authError = nil
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//            if let error = error {
//                self?.authError = error.localizedDescription
//                return
//            }
//
//            self?.user = result?.user
//            self?.isAuthenticated = true
//        }
//    }
//
//    // MARK: - Google Sign In
//    func signInWithGoogle() {
//        authError = nil
//
//        guard let clientID = FirebaseApp.app()?.options.clientID else {
//            self.authError = "Missing Google Client ID"
//            return
//        }
//
//        let config = GIDConfiguration(clientID: clientID)
//
//        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
//            self.authError = "No root view controller"
//            return
//        }
//
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: rootViewController) { [weak self] user, error in
//            if let error = error {
//                self?.authError = error.localizedDescription
//                return
//            }
//
//            guard
//                let authentication = user?.authentication,
//                let idToken = authentication.idToken
//            else {
//                self?.authError = "Google authentication failed"
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: authentication.accessToken)
//
//            Auth.auth().signIn(with: credential) { result, error in
//                if let error = error {
//                    self?.authError = error.localizedDescription
//                    return
//                }
//
//                self?.user = result?.user
//                self?.isAuthenticated = true
//            }
//        }
//    }
//
//    // MARK: - Sign Out
//    func signOut() {
//        do {
//            try Auth.auth().signOut()
//            self.user = nil
//            self.isAuthenticated = false
//
//            if GIDSignIn.sharedInstance.currentUser != nil {
//                GIDSignIn.sharedInstance.signOut()
//            }
//        } catch {
//            self.authError = error.localizedDescription
//        }
//    }
//}
