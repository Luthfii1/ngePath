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

class SavePlaces: Identifiable, ObservableObject {
    var name: String
    var coordinate: CLLocationCoordinate2D
    var category: Categories
    @Published var isFavorite: Bool
    var address: String
    
    init(name: String, coordinate: CLLocationCoordinate2D, category: Categories, isFavorite: Bool = false, address: String) {
        self.name = name
        self.coordinate = coordinate
        self.category = category
        self.isFavorite = isFavorite
        self.address = SavePlaces.minimizedAddress(address)
    }
    
    static func minimizedAddress(_ address: String) -> String {
        let components = address.components(separatedBy: ",")
        var minimizedAddress = ""
        let keywords = ["Jl.", "Jalan", "gg", "Gg", "gang", "Kec.", "Kota", "Kabupaten", "Provinsi"]
        
        // Check each of component if the component have the regex like above
        for component in components {
            let trimmedComponent = component.trimmingCharacters(in: .whitespacesAndNewlines)
            for keyword in keywords {
                if trimmedComponent.contains(keyword) {
                    minimizedAddress += ", \(trimmedComponent)"
                    break
                }
            }
        }
        
        // Remove leading comma and space if present
        if minimizedAddress.hasPrefix(", ") {
            minimizedAddress.removeFirst(2)
        }
        
        return minimizedAddress
    }
    
    var UUID: String {
        name
    }
}

