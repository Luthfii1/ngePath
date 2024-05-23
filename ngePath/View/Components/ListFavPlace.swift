//
//  ListFavPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import SwiftUI

struct ListFavPlace: View {
    @State private var favPlaces: [SavePlaces] = sampleSavePlaces.filter{ $0.isFavorite }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            ForEach (favPlaces, id: \.name) { place in
                FavPlace(logo: place.category.logo, loctName: place.name, loctPreview: place.address)
                
                Divider()
            }
        }
    }
}

#Preview {
    ListFavPlace()
}
