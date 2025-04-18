//
//  BookingModel.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-18.
//

import Foundation
import FirebaseFirestore

struct Booking: Identifiable, Codable {
    @DocumentID var id: String?
    let hotelName: String
    let checkIn: Date
    let checkOut: Date
    let rooms: Int
    let price: Double
    let status: String
    var userEmail: String? = ""
}
