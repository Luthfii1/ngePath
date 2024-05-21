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
    
//    print("text : ", request.naturalLanguageQuery)
//    print("region : ", request.region)
    
    let results = try? await MKLocalSearch(request: request).start()
    
//    print("return : ", results?.mapItems ?? [])
    
    return results?.mapItems ?? []
}
