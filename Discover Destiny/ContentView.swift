//
//  ContentView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
            DiscoverView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
