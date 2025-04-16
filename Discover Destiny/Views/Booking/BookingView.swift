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
struct BookingReviwsCardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Reviews")
                        .font(.headline)
                    HStack {
                        Image(systemName: "star.fill")
                        Text("4.5")
                        Text("(230 reviews)")
                    }
                    .font(.subheadline)
                }
                Spacer()
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

struct BookingFacilitiesView : View {
    var body: some View {
        VStack {
            
        }
    }
}



#Preview {
    BookingView()
}
