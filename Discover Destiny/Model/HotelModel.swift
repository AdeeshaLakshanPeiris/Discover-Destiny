//
//  HotelModel.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-18.
//

import Foundation
import CoreLocation

struct Hotel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let distanceFromCenter: String
    let price: Double
    let rating: Int
    let boardType: String
    let imageName: String
    let coordinates: CLLocationCoordinate2D
}


let sriLankanHotels: [Hotel] = [
    Hotel(
        name: "Saffron Beach Hotel",
        location: "Wadduwa",
        distanceFromCenter: "1.4km",
        price: 100.50,
        rating: 5,
        boardType: "Half board",
        imageName: "hotel1",
        coordinates: CLLocationCoordinate2D(latitude: 6.6850, longitude: 79.9303)
    ),
    Hotel(
        name: "Jetwing Blue",
        location: "Negombo",
        distanceFromCenter: "2.0km",
        price: 125.00,
        rating: 4,
        boardType: "Full board",
        imageName: "hotel2",
        coordinates: CLLocationCoordinate2D(latitude: 7.2090, longitude: 79.8380)
    ),
    Hotel(
        name: "Amari Galle",
        location: "Galle",
        distanceFromCenter: "1.8km",
        price: 145.75,
        rating: 5,
        boardType: "Bed & Breakfast",
        imageName: "hotel3",
        coordinates: CLLocationCoordinate2D(latitude: 6.0367, longitude: 80.2170)
    ),
    Hotel(
        name: "Cinnamon Grand",
        location: "Colombo",
        distanceFromCenter: "1.1km",
        price: 180.00,
        rating: 5,
        boardType: "Half board",
        imageName: "hotel4",
        coordinates: CLLocationCoordinate2D(latitude: 6.9180, longitude: 79.8560)
    ),
    Hotel(
        name: "Heritance Kandalama",
        location: "Dambulla",
        distanceFromCenter: "3.0km",
        price: 140.99,
        rating: 4,
        boardType: "Full board",
        imageName: "hotel5",
        coordinates: CLLocationCoordinate2D(latitude: 7.6742, longitude: 80.6750)
    ),
    Hotel(
        name: "Taj Bentota Resort",
        location: "Bentota",
        distanceFromCenter: "1.5km",
        price: 160.00,
        rating: 5,
        boardType: "All inclusive",
        imageName: "hotel6",
        coordinates: CLLocationCoordinate2D(latitude: 6.4224, longitude: 79.9975)
    ),
    Hotel(
        name: "The Grand Hotel",
        location: "Nuwara Eliya",
        distanceFromCenter: "0.5km",
        price: 130.00,
        rating: 4,
        boardType: "Bed & Breakfast",
        imageName: "hotel7",
        coordinates: CLLocationCoordinate2D(latitude: 6.9667, longitude: 80.7833)
    ),
    Hotel(
        name: "Anantaya Resort",
        location: "Chilaw",
        distanceFromCenter: "2.2km",
        price: 110.00,
        rating: 4,
        boardType: "Half board",
        imageName: "hotel8",
        coordinates: CLLocationCoordinate2D(latitude: 7.5833, longitude: 79.8000)
    ),
    Hotel(
        name: "Araliya Green Hills",
        location: "Nuwara Eliya",
        distanceFromCenter: "0.7km",
        price: 150.00,
        rating: 5,
        boardType: "Full board",
        imageName: "hotel9",
        coordinates: CLLocationCoordinate2D(latitude: 6.9497, longitude: 80.7893)
    ),
    Hotel(
        name: "Trinco Blu by Cinnamon",
        location: "Trincomalee",
        distanceFromCenter: "3.5km",
        price: 120.00,
        rating: 4,
        boardType: "Bed & Breakfast",
        imageName: "hotel10",
        coordinates: CLLocationCoordinate2D(latitude: 8.5860, longitude: 81.2345)
    )
]
