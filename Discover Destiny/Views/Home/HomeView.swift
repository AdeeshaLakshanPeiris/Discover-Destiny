//
//  HomeView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("AppBgColor").ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack(spacing: 0) {
                    HomeHeaderView()
                    HomeCoupenView()
                    SuggestionView()
                    HomeHotelsNearByView()
                    Spacer()
                }
            }
        }
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
            .padding(.top, 20)
        }
    }
}



struct SuggestionView: View {
    var body: some View {
            VStack {
                HStack(alignment: .bottom){
                    Text("You may like")
                        .foregroundColor(Color("DarkBlue"))
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Text("See all")
                        .foregroundColor(.blue)
                        .font(.system(size: 13, weight: .semibold))
                }
                .padding(15)
                ScrollView(.horizontal ,showsIndicators: false) {
                    HStack{
                        HomeSuggestionCardView(imageName: "sug_image")
                        HomeSuggestionCardView(imageName: "h3")
                        HomeSuggestionCardView(imageName: "h1")
                        HomeSuggestionCardView(imageName: "sug_image")
                        HomeSuggestionCardView(imageName: "h3")
                        HomeSuggestionCardView(imageName: "h1")
                        Spacer()

                    }
                }
                .padding(.horizontal)
                .padding(.top,-15)
               
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
                GeometryReader { geometry in
                    Image("HeaderImage")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3, opaque: true)
                }
            }
            .padding(.top, -(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 44))
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
        .onAppear(perform: {
            self.userName = Auth.auth().currentUser?.displayName ?? "User"
        })
        .frame(height: UIScreen.main.bounds.width * 0.5)
    }
}

struct HomeSuggestionCardView : View {
    
    let imageName : String
    
    @State var cardWidth = UIScreen.main.bounds.width / 2.7
    @State var cardHeight = UIScreen.main.bounds.width / 2.7 * 1.3
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)

            
            VStack(){
                HStack {
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 12))
                            .padding(.trailing , -3)
                        Text("5")
                            .foregroundColor(.black)
                            .font(.system(size: 12 , weight: .bold))
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
                .background(Color("LightBlue"))


               
            }

        }
        .background(Color("AppBg"))
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(12)


        
    }
}


struct HomeCoupenView : View {
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("👀 25% Flat Off 🔥")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text("Your next booking • before May 1st")
                                .font(.system(size: 13))
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("BBB12343")
                                .foregroundColor(Color("DarkBlue"))
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text("Your code")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            
                        }
                        .padding(.trailing,10)
                        
                    }
                    Spacer()
                    HStack{
                        Text("• Tearms and condions are applied")
                            .font(.system(size: 10))
                            .opacity(0.7)
                        Spacer()
                        HStack{
                            Text("Redeem now")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                
                        }
                        .padding(5)
                        .padding(.horizontal,10)
                        .background(Color("LightBlue"))
                        .cornerRadius(50)
                        .padding(.trailing,10)
                        .padding(.top,-5)

                    }
                    
                       
                    
                }
                .padding(.vertical,15)

                Spacer()
            }
            .padding(.leading,20)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color.white)
            .cornerRadius(10)
   
        }
        .padding(.bottom,10)
        .padding(.top,-25)
        .padding(.horizontal,30)
        

        
    }
}


struct HomeHotelsNearByView: View {
    var body: some View {
            VStack {
                HStack(alignment: .bottom){
                    Text("Top Nearby Hotels")
                        .foregroundColor(Color("DarkBlue"))
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                    
                    Text("See all")
                        .foregroundColor(.blue)
                        .font(.system(size: 13, weight: .semibold))
                }
                .padding(15)
                    VStack(spacing: 12){
                        HotelNearByCardView(imageName: "h2")
                        HotelNearByCardView(imageName: "hotel_landscape")
                        HotelNearByCardView(imageName: "h2")
                        HotelNearByCardView(imageName: "hotel_landscape")
                        HotelNearByCardView(imageName: "h2")
                        HotelNearByCardView(imageName: "hotel_landscape")
                       
                        Spacer()

                }
                .padding(.horizontal)
                .padding(.top,-15)
               
            }
           
            
            
        
            .background(Color("AppBgColor"))
            .padding(.top,10)
    }
}


struct HotelNearByCardView : View {
    
    let imageName: String
    @State var cardWidth = UIScreen.main.bounds.width - 32
    @State var cardHeight = UIScreen.main.bounds.width / 2.7
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)

            
            VStack(){
                HStack {
                    HStack{
                        Image(systemName: "car.fill")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 12))
                            .padding(.trailing , -3)
                        Text("1.4 KM / 2 min")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 12 , weight: .bold))
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
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("DarkBlue"))
                            .font(.system(size: 12))
                            .padding(.trailing , -3)
                        Text("5")
                            .foregroundColor(.black)
                            .font(.system(size: 12 , weight: .bold))
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
                        HStack{
                            Text("Saffron Beach Hotel")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .semibold))
                            Text("• 1.4km from center")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .semibold))
                            Spacer()
                            Text("100.50$")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .semibold))

                        }
                        HStack{
                            Text("Wadduwa")
                                .foregroundColor(.white)
                                .font(.system(size: 8, weight: .regular))
                                .opacity(0.7)
                            Spacer()
                            Text("Half board")
                                .foregroundColor(.white)
                                .font(.system(size: 8, weight: .regular))
                        }
                    }

                    Spacer()
                    
                }
                .padding(.vertical,5)
                .padding(.horizontal,10)
                .background(Color("LightBlue"))


               
            }

        }
        .background(Color("AppBg"))
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(12)


        
    }
}



extension Color {
    init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        guard hexString.count == 6 || hexString.count == 8 else {
            return nil
        }

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        let r, g, b, a: Double
        if hexString.count == 6 {
            r = Double((rgb & 0xFF0000) >> 16) / 255
            g = Double((rgb & 0x00FF00) >> 8) / 255
            b = Double(rgb & 0x0000FF) / 255
            a = 1.0
        } else {
            r = Double((rgb & 0xFF000000) >> 24) / 255
            g = Double((rgb & 0x00FF0000) >> 16) / 255
            b = Double((rgb & 0x0000FF00) >> 8) / 255
            a = Double(rgb & 0x000000FF) / 255
        }

        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}


