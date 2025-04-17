//
//  ContentView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-09.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var isSignedIn: Bool = false
    init() {
        
        if Auth.auth().currentUser != nil {
            _isSignedIn = State(initialValue: true)
        } else {
            _isSignedIn = State(initialValue: false)
        }
    }

    var body: some View {
        VStack {
            if isSignedIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    
                    DiscoverView()
                        .tabItem {
                            Label("Discover", systemImage: "magnifyingglass")
                        }
                    MapView()
                        .tabItem {
                            Label("Map", systemImage: "map.fill")
                        }
                    
                    ARView()
                        .tabItem {
                            Label("Saved", systemImage: "bookmark.fill")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                }
            } else {
                LoginView(isSignedIn: $isSignedIn)
            }
        }
    }
}


#Preview {
    ContentView()
}
