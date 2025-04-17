//
//  Discover_DestinyApp.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-09.
//

import SwiftUI
import Firebase

@main
struct Discover_DestinyApp: App {
    @StateObject private var authViewModel = AuthViewModel()

    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
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
