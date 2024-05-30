//
//  SheetMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct SheetMarkPlace : View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HeaderSheet(isCreate: true)
                    .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        CurrentPlaceMarkPlace()
                            .padding(6)
                        
                        SetCategoriesMarkPlace()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(6)
                        
                        SetRatingMarkPlace()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(6)
                        
                        VStack(alignment: .leading) {
                            Title(text: "Add Story")
                                .font(.title)
                                .padding(.vertical, 8)
                            
                            TextFieldInput(placeholder: "Story Title", isSearching: false)
                                .frame(width: 200)
                            
                            TextFieldInput(placeholder: "Description Title", isSearching: false)
                                .lineLimit(5...10)
                            
                            DummySetImagesMarkPlace()
                        }
                        .padding(12)
                    }
                }
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button(action: {
                        //                                    guard !vm.inputUser.placeName.isEmpty else { return }
                        //                                    coreData.addPlace(placeName: vm.inputUser.placeName, setPlaceName: vm.inputUser.setPlaceName, longitude: locationManager.userLocation.longitude, lattitude: locationManager.userLocation.latitude)
                    }, label: {
                        Text("Submit")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.primaryPink)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
    }
}

#Preview {
    SheetMarkPlace()
}
