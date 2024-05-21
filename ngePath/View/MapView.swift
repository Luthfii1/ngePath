//
//  MapView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var result = [MKMapItem]()
    @State private var mapSelection : MKMapItem?
    @State private var categories: [Categories] = sampleCategories
    @State private var setCategory: String = ""
    @State private var textSearch: String = ""
    @State private var isSetPlace: Bool = false
    @State private var isFavPlace: Bool = false
    @State private var placeName: String = ""
    @State private var storyTitle: String = ""
    @State private var storyDescription: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            Map(position: $cameraPosition, selection: $mapSelection) {
                // User Location
                Annotation("My Location", coordinate: .userLoct) {
                    UserAnotation()
                }
                // End of User Location
                
                // Search Results
                ForEach(result, id: \.self) { item in
                    Marker(item.placemark.name ?? "", coordinate: item.placemark.coordinate)
                }
                // End of Search Results
            }
            .mapControls {
                MapPitchToggle()
                MapCompass()
                MapUserLocationButton()
            }
            .overlay(alignment: .bottomTrailing){
                VStack (spacing: 10) {
                    Button(action: {
                        isSetPlace.toggle()
                    }, label: {
                        HStack (alignment: .center) {
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
                DraggableSheetView(result: $result, setCategory: $setCategory)
            }
            .sheet(isPresented: $isSetPlace, content: {
                VStack(alignment: .leading) {
                    HeaderSheet(isSetPlace: $isSetPlace, isFavPlace: $isFavPlace)
                        .padding(.bottom, 20)
                    
                    ScrollView (.vertical, showsIndicators: false) {
                        VStack {
                            CurrentPlace(placeName: $placeName)
                                .padding(6)
                            
                            SetCategories(setCategory: $setCategory)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(6)
                            
                            SetStarRate()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(6)
                            
                            VStack(alignment: .leading) {
                                Title(text: "Add Story")
                                    .font(.title)
                                    .padding(.vertical, 8)
                                
                                TextFieldInput(placeholder: "Story Title", isSearching: false, searchResult: $storyTitle)
                                    .frame(width: 200)
                                
                                TextFieldInput(placeholder: "Description Title", isSearching: false, searchResult: $storyDescription)
                                    .lineLimit(5...10)
                                
                                SetImages()
                            }
                            .padding(12)
                        }
                    }
                    
                    HStack (alignment: .center, content: {
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
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            })
        }
    }
}

#Preview {
    MapView()
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
    @Binding var isSetPlace: Bool
    @Binding var isFavPlace: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    isSetPlace.toggle()
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
                
                Image(systemName: isFavPlace ? "heart.fill" : "heart")
                    .foregroundStyle(.primaryBlue)
                    .font(.title2)
                    .onTapGesture {
                        isFavPlace.toggle()
                    }
            }
            
            Rectangle()
                .frame(width: .infinity, height: 1)
        }
    }
}

struct CurrentPlace: View {
    @Binding var placeName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "You're Currently At")
                .font(.title)
            
            HStack (alignment: .center, spacing: 10) {
                TextFieldInput(placeholder: "Apple Developer Acadeny", isSearching: false, searchResult: $placeName)
                
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
    @State private var categories: [Categories] = sampleCategories
    @Binding var setCategory: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Title(text: "Categories")
                .font(.title)
            JustifyMappingComponent(objects: categories, setCategory: $setCategory, isJustifyBetween: false)
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
