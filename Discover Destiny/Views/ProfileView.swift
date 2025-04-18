//
//  ProfileView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hello, \(authViewModel.user?.displayName ?? "User")!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.darkBlue)
                    
                    Text(authViewModel.user?.email ?? "No Email")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
            
            Button(action: {
                authViewModel.signOut()
            }) {
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.white)
                    Text("Sign Out")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.red)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
