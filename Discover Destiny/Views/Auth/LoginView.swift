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
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var authViewModel: AuthViewModel

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
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.5)
                
                VStack(spacing: 8) {
                    TextField("Email", text: $username)
                        .font(.system(size: 14))
                        .padding(.vertical,15)
                        .padding(.horizontal,15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 14))
                        .padding(.vertical,15)
                        .padding(.horizontal,15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    guard !username.isEmpty else {
                        alertMessage = "Please enter your email."
                        showAlert = true
                        return
                    }
                    
                    guard !password.isEmpty else {
                        alertMessage = "Please enter your password."
                        showAlert = true
                        return
                    }
                    
                    authViewModel.loginWithEmail(email: username, password: password)                }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 14))
                            .padding(.vertical,15)
                            .padding(.horizontal,15)
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
                        .font(.system(size: 12))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.5))
                }
                
                Button(action: {
                    if authViewModel.isAuthenticated {
                        authViewModel.didCompleteBiometricAuth = authViewModel.isAuthenticated
                    }
                }) {
                    HStack {
                        Image("google_ico")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .scaledToFit()
                        Text("Login with Google")
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,15)
                    .padding(.horizontal,15)
                    .background(Color.white)
                    .foregroundColor(Color("DarkBlue"))
                    .cornerRadius(10)
                }
                
                Spacer()
                NavigationLink(destination: SignUpView()
                    .environmentObject(authViewModel)) {
                    HStack {
                        HStack{
                            Text("Haven't Account?")
                                .font(.system(size: 14))
                            Text("Register Here")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .foregroundColor(Color.white)
                }
                .navigationBarBackButtonHidden()
            }
            .padding(.horizontal, 32)
            
            Spacer()
            
            
            
        }
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Login Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        
        .onReceive(authViewModel.$authError) { error in
            if let error = error {
                alertMessage = error
                showAlert = true
            }
        }
        
        .onReceive(authViewModel.$isAuthenticated) { authenticated in
            if authenticated {
                authViewModel.didCompleteBiometricAuth = authenticated
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    let s = true
    LoginView()
        .environmentObject(AuthViewModel())

}
