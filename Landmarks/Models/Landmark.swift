//
//  Landmark.swift
//  Landmarks
//
//  Created by Alina Costache on 6/17/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    let name: String
    let category: String
    let city: String
    let state: String
    let id: Int
    let isFeatured: Bool
    var isFavorite: Bool
    let park: String
    let description: String

    private let imageName: String
    
    var image: Image {
        return Image(imageName)
    }
    
    let coordinates: Coordinate

    var locationCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    
    
    struct Coordinate: Hashable, Codable {
        let longitude: Double
        let latitude: Double
    }
}
