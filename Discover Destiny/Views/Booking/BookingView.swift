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
                Spacer()
                VStack(){
                    HStack{
                        VStack(alignment: .leading){
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
                }
            }
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    BookingView()
}
