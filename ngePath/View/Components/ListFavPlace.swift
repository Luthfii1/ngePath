//
//  ListFavPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import SwiftUI

struct ListFavPlace: View {
    @State private var favPlaces: [FavPlaces] = sampleFavPlaces
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            ForEach (favPlaces, id: \.placeName) { place in
                FavPlace(logo: place.category.logo, loctName: place.placeName, loctPreview: place.placeDetail)
                
                Divider()
            }
        }
    }
}

#Preview {
    ListFavPlace()
}
