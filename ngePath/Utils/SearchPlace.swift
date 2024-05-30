//
//  Search.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 17/05/24.
//

import SwiftUI
import MapKit

func searchPlace (text: String) async -> [MKMapItem] {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = text
    request.region = .userRegion
    
    let results = try? await MKLocalSearch(request: request).start()
    
    return results?.mapItems ?? []
}
