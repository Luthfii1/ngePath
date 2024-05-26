//
//  ListFavPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import SwiftUI

struct ListFavPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        let favPlaces: [SavePlaces] = vm.sampleResult.filter{ $0.isFavorite }
        
        VStack (alignment: .leading, spacing: 20) {
            ForEach (favPlaces, id: \.name) { place in
                Button(action: {
                    vm.selectedItem = place
                }, label: {
                    FavPlace(logo: place.category.logo, loctName: place.name, loctPreview: place.address)
                })
                
                Divider()
            }
        }
    }
}

#Preview {
    ListFavPlace()
        .environmentObject(LocationViewModel())
}
