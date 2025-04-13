//
//  DiscoverView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-12.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("AppBgColor").ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack(spacing: 0) {
                    SearchHeaderView()
                    SearchCardView()
                    SearchTopSearchesView()
                    Spacer()
                }
                .padding(.horizontal,20)
            }
        }
    }
}

struct SearchHeaderView : View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, content: {
                Text("Hello Adeesha")
                    .font(.system(size: 16, weight: .semibold))
                    .opacity(0.6)
                Text("Let's find the best hotel for you")
                    .foregroundColor(Color("DarkBlue"))
                    .font(.system(size: 30, weight: .heavy))
            })
            Spacer()
        }
        .padding(.top,15)
        .padding(.bottom,25)
    }
}


struct SearchCardView: View {
    @State private var searchText: String = ""
    @State private var selectedDate: String = ""
    @State private var selectedRooms: String = ""
    
    let minPrice: Double = 50
    @State private var maxPrice: Double = 300
    
    var body: some View {
        VStack(spacing: 10){
            HStack(alignment: .center, spacing: 15){
                Image("SearchIcon")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .opacity(0.5)
                
                TextField("Enter your destination", text: $searchText)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(10)
            .background(Color("LightGray"))
            .cornerRadius(8)
            
            HStack {
                HStack(alignment: .center, spacing: 15){
                    Image(systemName: "calendar.badge.clock.rtl")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .opacity(0.5)
                    TextField("Dates", text: $selectedDate)
                        .foregroundColor(.black)
                }
                .padding(10)
                .background(Color("LightGray"))
                .cornerRadius(8)
                
                Spacer().frame(width: 10)
                
                HStack(alignment: .center, spacing: 15){
                    Image(systemName: "bed.double")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .opacity(0.5)
                    TextField("Rooms", text: $selectedRooms)
                        .foregroundColor(.black)
                }
                .padding(10)
                .background(Color("LightGray"))
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text("Max Price")
                    .font(.system(size: 14, weight: .semibold))
                HStack {
                    Text("From $\(Int(minPrice))")
                    Spacer()
                    Text("To $\(Int(maxPrice))")
                }
                .font(.system(size: 12))
                .foregroundColor(.gray)
                
                Slider(value: $maxPrice, in: minPrice...500, step: 10)
                    .accentColor(Color("LightBlue"))
            }
            
            Button {
                
            } label: {
                Spacer()
                Text("SEARCH HOTEL")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical,15)
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
            }
            .background(Color("LightBlue"))
            .cornerRadius(8)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct SearchTopSearchesView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom){
                Text("Top searched hotels")
                    .foregroundColor(Color("DarkBlue"))
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
               
            }
            VStack(spacing: 12){
                TopSearchCardView(imageName: "h2")
                TopSearchCardView(imageName: "hotel_landscape")
                TopSearchCardView(imageName: "h2")
                TopSearchCardView(imageName: "hotel_landscape")
                TopSearchCardView(imageName: "h2")
                TopSearchCardView(imageName: "hotel_landscape")
                
                Spacer()
                
            }
            
        }
        
        
        
        
        .background(Color("AppBgColor"))
        .padding(.top,25)
    }
}

struct TopSearchCardView : View {
    
    let imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
            
            
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
        .cornerRadius(12)
        
        
        
    }
}



#Preview {
    DiscoverView()
}
