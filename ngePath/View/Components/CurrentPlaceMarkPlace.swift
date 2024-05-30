//
//  CurrentPlaceMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct CurrentPlaceMarkPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    @EnvironmentObject private var locationManager: LocationManagerViewModel
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Place>
    @State private var isRefreshing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "You're Currently At")
                .font(.title)
            
            HStack (alignment: .center, spacing: 10) {
                TextFieldInput(placeholder: vm.inputUser.placeName, isSearching: false)
                
                Button(action: {
                    locationManager.refreshLocation()
                    isRefreshing = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isRefreshing = false
                        }
                    }
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .font(.title2)
                        .foregroundStyle(isRefreshing ? Color.secondaryPink : Color.primaryPink)
                        .rotationEffect(.degrees(isRefreshing ? 180 : 0))
                })
            }
        }
    }
}

#Preview {
    CurrentPlaceMarkPlace()
}
