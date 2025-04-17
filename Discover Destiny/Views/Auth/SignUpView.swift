//
//  SignUpView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-17.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var isSignedIn: Bool
    @ObservedObject var authViewModel = AuthViewModel()
    
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
                
                VStack(spacing: 5) {
                    HStack{
                        TextField("First Name", text: $firstName)
                            .font(.system(size: 14))
                            .padding(.vertical,10)
                            .padding(.horizontal,15)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                        
                        TextField("Last Name", text: $lastName)
                            .font(.system(size: 14))
                            .padding(.vertical,10)
                            .padding(.horizontal,15)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                    }
                    
                    TextField("Email", text: $email)
                        .font(.system(size: 14))
                        .padding(.vertical,10)
                        .padding(.horizontal,15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 14))
                        .padding(.vertical,10)
                        .padding(.horizontal,15)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    authViewModel.signUpWithEmail(email: email, password: password, firstName: firstName, lastName: lastName)
                    if authViewModel.isAuthenticated {
                        isSignedIn = true
                    }
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 14))
                        .padding(.vertical,10)
                        .padding(.horizontal,15)
                        .fontWeight(.bold)
                        .background(Color.white)
                        .foregroundColor(Color("DarkBlue"))
                        .cornerRadius(10)
                }
                
                if let error = authViewModel.authError {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.top, 5)
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
                    if authViewModel.isAuthenticated {
                        isSignedIn = true
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
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                    .background(Color.white)
                    .foregroundColor(Color("DarkBlue"))
                    .cornerRadius(10)
                }
                
                Spacer()
                NavigationLink(destination: LoginView(isSignedIn: .constant(false))) {
                    HStack {
                        Text("Already have an account? Login")
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                }

            }
            .padding(.horizontal, 40)
            
            Spacer()
            
           
            
        }
        .fontWeight(.semibold)

    }
}



#Preview {
    SignUpView(isSignedIn: .constant(false))
}
