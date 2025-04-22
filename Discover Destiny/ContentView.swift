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
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            if authViewModel.isAuthenticated {
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    DiscoverView()
                        .tabItem {
                            Label("Discover", systemImage: "magnifyingglass")
                        }
                    MapView()
                        .tabItem {
                            Label("Map", systemImage: "map.fill")
                        }
                    BookingHistoryView()
                        .tabItem {
                            Label("Booking", systemImage: "bookmark.fill")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                        .environmentObject(authViewModel)
                }
            } else {
                SignUpView()
                    .environmentObject(authViewModel)
                
                //LoginView(isSignedIn: $authViewModel.isAuthenticated )
                   // .environmentObject(authViewModel)
            }
        }
       
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}

