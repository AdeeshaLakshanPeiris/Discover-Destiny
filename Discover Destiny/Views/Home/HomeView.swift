//
//  HomeView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
            VStack(spacing: 0) {
                HomeHeaderView()
                SuggestionView()
                Spacer()
            }
            .background(Color("AppBgColor"))
    }
       
}



struct HomeSearchView: View {
    
    let viewWidth = UIScreen.main.bounds.width - 120
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black.opacity(0.6))
                    
                    Text("Search Hotels")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(width: viewWidth)
            .background(
                Color.white.opacity(0.50)
                    .blur(radius: 10)
            )
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.25), lineWidth: 1)
            )
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 2)
            .padding(.top, 30)
        }
    }
}



struct SuggestionView: View {
    var body: some View {
            VStack {
                HStack{
                    Text("You may like")
                        .foregroundColor(.black.opacity(0.8))
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Text("See all")
                        .foregroundColor(.blue)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(15)
                ScrollView(.horizontal ,showsIndicators: false) {
                    HStack{
                        HomeSuggestionCardView()
                        HomeSuggestionCardView()
                        HomeSuggestionCardView()
                        HomeSuggestionCardView()
                        HomeSuggestionCardView()
                        Spacer()

                    }
                }
                .padding(.horizontal)
               
            }
           
            
            
        
            .background(Color("AppBgColor"))
    }
}

#Preview {
    HomeView()

}


struct HomeHeaderView : View {
    @State private var userName: String = "Adeesha"

    var body: some View{
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                Image("HeaderImage")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 3, opaque: true)
            }

            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: -3) {
                        Text("Hey, \(userName)!")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                            .shadow(color: .black, radius: 15)
                        
                        Text("Let's start exploring 👋")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .shadow(color: .black, radius: 15)
                    }

                    Spacer()

                    Image("UserImage")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .cornerRadius(25)
                }

                HStack {
                    Spacer()
                    HomeSearchView()
                    Spacer()
                }
            }

            .padding(.vertical, 10)
            .padding(.horizontal, 25)

        }
        .frame(height: UIScreen.main.bounds.width * 0.5)
    }
}

struct HomeSuggestionCardView : View {
    
    @State var cardWidth = UIScreen.main.bounds.width / 2.7
    @State var cardHeight = UIScreen.main.bounds.width / 2.7 * 1.3
    
    var body: some View {
        ZStack {
            Image("sug_image")
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)

            
            VStack(){
                HStack {
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 15))
                            .padding(.trailing , -3)
                        Text("5")
                            .foregroundColor(.black)
                            .font(.system(size: 15 , weight: .bold))
                            .opacity(0.8)
                    }
                    .padding(.horizontal,5)
                    .padding(.vertical,2)

                    .background(
                        Color.white.opacity(0.4)
                            .blur(radius: 0.5)
                    )
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(10)

                }
                
                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Saffron Beach Hotel")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .semibold))
                        Text("Wadduwa")
                            .foregroundColor(.white)
                            .font(.system(size: 8, weight: .regular))
                            .opacity(0.7)
                    }

                    Spacer()
                }
                .padding(.vertical,5)
                .padding(.horizontal,10)
                .background(Color("DarkBlue"))


               
            }

        }
        .background(Color("AppBg"))
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(12)


        
    }
}

struct HomeCoupenView : View {
    var body: some View {
        ZStack {
            
        }
    }
}
