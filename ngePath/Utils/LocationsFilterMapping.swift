//
//  LocationsFilterMapping.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 22/05/24.
//

import Foundation

func categoryFilterMapping(locations: [SavePlaces], category: [String]) -> [SavePlaces] {
    var result: [SavePlaces] = []
    
    if category.isEmpty {
        return locations
    }
    
    for location in locations {
//        print("category: ", location.category.name.rawValue, " real: \(category)")
        if category.contains(where: { $0.lowercased() == location.category.name.rawValue.lowercased() }) {
            result.append(location)
        }
    }
    
    return result
}
