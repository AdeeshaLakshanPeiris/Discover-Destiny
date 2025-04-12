//
//  LoginView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Image("AppBg")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 6)
            
            Color.white.opacity(0.05)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.5)
                
                VStack(spacing: 12) {
                    TextField("Username", text: $username)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.bold)
                        .background(Color.white)
                        .foregroundColor(Color("DarkBlue"))
                        .cornerRadius(10)
                }
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.5))
                    Text("OR")
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.5))
                }
                
                Button(action: {
                
                }) {
                    HStack {
                        Image("google_ico")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .scaledToFit()
                        Text("Login with Google")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color("DarkBlue"))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal, 32)
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
