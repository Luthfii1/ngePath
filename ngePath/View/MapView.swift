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
    @StateObject var locationManager: LocationManager = .init()
    @State private var dummy: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        VStack {
            if vm.showMap {
                GeometryReader { geometry in
                    Map(position: $vm.mapCamera /*$dummy*/) {
                        // User Location
                        Annotation("My Location", coordinate: CLLocationCoordinate2D(latitude: locationManager.userLocation.latitude, longitude: locationManager.userLocation.longitude)) {
                            UserAnotation()
                        }
                        // End of User Location
                        
                        // Filtered Locations
                        ForEach(vm.filteredPlaces, id: \.name) { item in
                            Annotation("", coordinate: item.coordinate) {
                                LocationMapAnnotationView(name: item.name)
                                    .onTapGesture {
                                        withAnimation(.bouncy, {
                                            vm.selectedItem = item
                                        })
                                    }
                                    .scaleEffect(vm.selectedItem.UUID == item.UUID ? 1 : 0.7)
                            }
                        }
                        // End of Filtered Locations
                    }
                    .onAppear(perform: {
                        vm.mapCamera = .region(MKCoordinateRegion(center: locationManager.userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000))
                        
                        print(vm.mapCamera)
                    })
                    .mapControls {
                        MapPitchToggle()
                        MapCompass()
                        MapUserLocationButton()
                    }
                    .overlay(alignment: .top) {
        //                if vm.mapLocation !== nil {
                            HStack(alignment: .center, content: {
                                Image(systemName: vm.selectedItem.category.logo)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(Color.primaryBlue)
                                
                                Text(vm.selectedItem.name)
                                    .font(.title2)
                                    .bold()
                                    .padding(.horizontal, 4)
                                
                                Spacer()
                                
                                Button(action: {
                                    vm.toggleOpenPlace()
                                    print("see more: ", vm.boolState.isOpenedDetailPlace)
                                }, label: {
                                    Text("See More")
                                        .padding()
                                        .background(Color.secondaryBlue)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                })
                            })
                            .padding()
                            .padding(.horizontal, 20)
                            .background(.white)
                            .frame(maxWidth: geometry.size.width * 0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
        //                }
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
                            HeaderSheet(isCreate: true)
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
        //                            print("Submit")
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
                    .sheet(isPresented: $vm.boolState.isOpenedDetailPlace){
                        DetailPlace()
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
                Text("Fetching Your Location")
            }
        }
        .onChange(of: locationManager.isLocationAuthorized){ oldValue, newValue in
            if newValue {
                vm.showMap = true
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

struct CurrentPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Title(text: "You're Currently At")
                .font(.title)
            
            HStack (alignment: .center, spacing: 10) {
                TextFieldInput(placeholder: "Apple Developer Acadeny", isSearching: false)
                
                Button(action: {
//                    print("Refresh")
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
//                    print("Images")
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
                
                ScrollableImages(story: false, gallery: false)
            }
        }
    }
}
