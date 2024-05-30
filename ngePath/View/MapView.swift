//
//  MapView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI
import MapKit
import CoreData

struct MapView: View {
    @EnvironmentObject private var vm: LocationViewModel
    @EnvironmentObject var locationManager: LocationManagerViewModel
    //    @EnvironmentObject var coreData: CoreDataViewModel
    
    var body: some View {
        VStack {
            if vm.boolState.showMap {
                GeometryReader { geometry in
                    Map(position: $vm.mapCamera) {
                        Annotation("My Location", coordinate: CLLocationCoordinate2D(latitude: locationManager.userLocation.latitude, longitude: locationManager.userLocation.longitude)) {
                            UserAnnotation()
                        }
                        
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
                    }
                    .onAppear(perform: {
                        vm.mapCamera = .region(MKCoordinateRegion(center: locationManager.userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000))
                        
                        locationManager.getPlaceName(coordinate: locationManager.userLocation) { name in
                            vm.inputUser.placeName = name ?? "Unknown Location"
                        }
                    })
                    .mapControls {
                        MapPitchToggle()
                        MapCompass()
                        MapUserLocationButton()
                    }
                    .overlay(alignment: .top) {
                        HStack(alignment: .center, content: {
                            Image(systemName: vm.selectedItem.category.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.primaryPink)
                            
                            Text(vm.selectedItem.name)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal, 4)
                            
                            Spacer()
                            
                            Button(action: {
                                vm.toggleOpenPlace()
                            }, label: {
                                Text("See More")
                                    .foregroundStyle(Color.primaryPink)
                                    .padding()
                                    .background(Color.secondaryPink)
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
                        //                        ButtonMarkPlace()
                        VStack(spacing: 10) {
                            Button(action: {
                                vm.toggleMarkPlace()
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
                                .background(Color.primaryPink)
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
                        SheetMarkPlace()
                    }
                    .sheet(isPresented: $vm.boolState.isOpenedDetailPlace){
                        DetailPlace()
                    }
                }
            } else {
                LandingPageView(isLoading: true)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: locationManager.isLocationAuthorized){ oldValue, newValue in
            if newValue {
                vm.boolState.showMap = true
            }
        }
    }
}


#Preview {
    MapView()
        .environmentObject(LocationViewModel())
        .environmentObject(LocationManagerViewModel())
}
