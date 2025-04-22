//
//  Discover_DestinyApp.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-09.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct Discover_DestinyApp: App {
    @StateObject var authViewModel = AuthViewModel()

    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        if Auth.auth().currentUser != nil {
            authViewModel.isAuthenticated = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(authViewModel)
            }
        }
    }
}
