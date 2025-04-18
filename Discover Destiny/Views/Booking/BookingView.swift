//
//  BookingView.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-13.
//

import SwiftUI

struct BookingView: View {
    var body: some View {
        ZStack {
            VStack {
                VStack(){
                    ZStack {
                        Image("h1")
                            .resizable()
                            .ignoresSafeArea()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.width / 1.2)
                    .aspectRatio(contentMode: .fill)
                    
                    HStack{
                        VStack(alignment: .leading , spacing: 5){
                            Text("Safron Beach Hotel")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.darkBlue)
                            HStack{
                                Text("12, Galle Rd , Wadduwa")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.darkBlue)
                                    .opacity(0.6)
                                Text("• 1.4 KM from center")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.darkBlue)
                                    .opacity(0.6)
                                Spacer()
                            }
                            HStack(alignment: .lastTextBaseline){
                                Text("$190.32/")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.lightBlue)
                                Text("1 night")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.darkBlue)
                                    .opacity(0.6)
                                    .padding(.leading ,-5)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                            
                    }
                    
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top, -40)

                    BookingReviwsCardView()
                    BookingFacilitiesView()
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Text("BOOK NOW")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.lightBlue)
                        .cornerRadius(12)
                        .padding(.horizontal ,20)
                        .padding(.bottom)
                    }
                    

                    
                }
            }
        }
    }
}


struct Facility: Identifiable {
    let id = UUID()
    let iconName: String
    let label: String
}

let facilities: [Facility] = [
    .init(iconName: "wifi", label: "Free Wifi"),
    .init(iconName: "figure.walk", label: "Gym"),
    .init(iconName: "drop.fill", label: "Pool"),
    .init(iconName: "fork.knife", label: "Full Kitchen"),
    .init(iconName: "wind", label: "Air Con")
]

struct BookingFacilitiesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Popular amenities")
                .font(.headline)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(facilities) { facility in
                        VStack(spacing: 8) {
                            Image(systemName: facility.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.darkBlue)
                            
                            Text(facility.label)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.darkBlue)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.top, 10)
    }
}

struct BookingReviwsCardView: View {
    let sampleAvatars = ["person.circle", "person.circle.fill", "person.2.circle", "person.3"]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Reviews")
                        .font(.headline)
                        .foregroundColor(.darkBlue)
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.9")
                            .bold()
                        Text("(1120 reviews)")
                            .foregroundColor(.gray)
                    }
                    .font(.subheadline)
                }

                Spacer()

                HStack(spacing: -10) {
                    ForEach(sampleAvatars.indices, id: \.self) { i in
                        Image(systemName: sampleAvatars[i])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .clipShape(Circle())
                            .background(Circle().fill(Color.white))
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .shadow(radius: 1)
                    }
                }

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.darkBlue, lineWidth: 0.2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1)
        .padding(.horizontal, 20)
    }
}




#Preview {
    BookingView()
}
