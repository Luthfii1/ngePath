//
//  DummyLoct.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    static var userLoct: CLLocationCoordinate2D {
        return .init(
            latitude: -6.303338,
            longitude: 106.638168
        )
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(
            center: .userLoct,
            latitudinalMeters: 10000,
            longitudinalMeters: 10000
        )
    }
}


enum CategoryType: String {
    case coffeeshop, restaurant, publicSpace, library
}

class SavePlaces {
    var name: String
    var coordinate: CLLocationCoordinate2D
    var category: CategoryType
    
    init(name: String, coordinate: CLLocationCoordinate2D, category: CategoryType) {
        self.name = name
        self.coordinate = coordinate
        self.category = category
    }
}
