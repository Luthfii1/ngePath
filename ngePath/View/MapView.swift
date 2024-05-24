//
//  MapView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            Map(position: $vm.mapCamera, selection: $vm.mapSelection) {
                // User Location
                Annotation("My Location", coordinate: .userLoct) {
                    UserAnotation()
                }
                // End of User Location
                
                // Filtered Locations
                ForEach(vm.filteredPlaces, id: \.name) { item in
                    Marker(item.name, coordinate: item.coordinate)
                }
                // End of Filtered Locations
            }
            .mapControls {
                MapPitchToggle()
                MapCompass()
                MapUserLocationButton()
            }
            .overlay(alignment: .bottomTrailing) {
                VStack(spacing: 10) {
                    Button(action: {
                        vm.toggleMarkPlace()
                        print("setplace: ", vm.boolState.isMarkPlace)
                    }, label: {
                        HStack(alignment: .center) {
                            Image(systemName: "scope")
                                .foregroundStyle(.white)
                            
                            Text("Mark Place")
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background(Color("PrimaryBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    })
                }
                .buttonBorderShape(.circle)
                .padding(.horizontal, geometry.size.width * 0.03)
            }
            .overlay(alignment: .bottomLeading) {
                DraggableSheetView()
            }
            .sheet(isPresented: $vm.boolState.isMarkPlace) {
                VStack(alignment: .leading) {
                    HeaderSheet()
                        .padding(.bottom, 20)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            CurrentPlace()
                                .padding(6)
                            
                            SetCategories()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(6)
                            
                            SetStarRate()
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
                                
                                SetImages()
                            }
                            .padding(12)
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Spacer()
                        
                        Button(action: {
                            print("Submit")
                        }, label: {
                            Text("Submit")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.primaryBlue)
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
}


#Preview {
    MapView()
        .environmentObject(LocationViewModel())
}

struct UserAnotation: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(.blue.opacity(0.3))
            
            Circle()
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
            
            Circle()
                .frame(width: 16, height: 16)
                .foregroundStyle(.blue)
        }
    }
}

struct HeaderSheet: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    vm.toggleMarkPlace()
                }, label: {
                    Text("Cancel")
                        .font(.title3)
                        .foregroundStyle(Color.primaryBlue)
                })
                
                Spacer()
                
                Text("Add New Place")
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Image(systemName: vm.boolState.isFavPlace ? "heart.fill" : "heart")
                    .foregroundStyle(.primaryBlue)
                    .font(.title2)
                    .onTapGesture {
                        vm.toggleFavPlace()
                    }
            }
            
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: 1)
                    .foregroundColor(.gray)
            }
            .frame(height: 1)
        }
    }
}

struct CurrentPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "You're Currently At")
                .font(.title)
            
            HStack (alignment: .center, spacing: 10) {
                TextFieldInput(placeholder: "Apple Developer Acadeny", isSearching: false)
                
                Button(action: {
                    print("Refresh")
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .font(.title2)
                })
            }
        }
    }
}

struct SetCategories: View {
    var body: some View {
        VStack (alignment: .leading) {
            Title(text: "Categories")
                .font(.title)
            JustifyMappingComponent( isJustifyBetween: false)
        }
    }
}

struct SetStarRate: View {
    @State private var selectedStar: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "Rate The Place")
                .font(.title)
            
            HStack(alignment: .center) {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= selectedStar ? "star.fill" : "star")
                        .onTapGesture {
                            selectedStar = star
                        }
                        .font(.largeTitle)
                        .foregroundStyle(Color.primaryBlue)
                }
            }
            .padding(.top, 4)
        }
    }
}

struct SetImages: View {
    @State private var photos: [Gallery] = sampleGalleries
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Images")
                .font(.headline)
                .padding(.vertical, 2)
            
            Text("3 Images Uploaded")
                .font(.caption)
                .foregroundStyle(Color.secondaryBlue.opacity(10))
                .padding(.vertical, 2)
            
            HStack (alignment: .center){
                Button(action: {
                    print("Images")
                }, label: {
                    Image(systemName: "photo.stack")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.primaryBlue)
                        .padding()
                        .background(Color.secondaryBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                })
                
                Divider()
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 8) {
                        ForEach(photos, id: \.name) { photo in
                            Button(action: {
                                print(photo.name)
                            }, label: {
                                Image(photo.logo)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            })
                        }
                    }
                }
            }
        }
    }
}
