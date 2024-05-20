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
    @State private var searchText: String = ""
    @State private var result = [MKMapItem]()
    @State private var mapSelection : MKMapItem?
    @Namespace private var locationSpace
    @State private var isSheetPresented: Bool = true
    @State private var categories: [Categories] = sampleCategories
    
    var body: some View {
        GeometryReader { geometry in
            Map(position: $cameraPosition, selection: $mapSelection, scope: locationSpace) {
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
            .onSubmit (of: .text) {
                Task {
                    result = await searchPlace(searchText: searchText)
                }
            }
            .overlay(alignment: .bottomTrailing){
                VStack (spacing: 10) {
                    MapPitchToggle(scope: locationSpace)
                    //                    MapCompass()
                    MapUserLocationButton(scope: locationSpace)
                    Button(action: {
                        print("Hai")
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                    })
                }
                .buttonBorderShape(.circle)
                .padding(geometry.size.width * 0.03)
            }
            .mapScope(locationSpace)
            .sheet(isPresented: $isSheetPresented) {
                VStack (alignment: .leading) {
                    SearchBar(placeholder: "Search Place Have You Been Visited")
                        .padding(.horizontal, 100)
                        .padding(.top, 20)
                    // Display until here if not drag to the top
                    
                    // Categories of places
                    Group {
                        Title(text: "Filter by Categories")
                        JustifyMappingComponent(objects: categories)
                    }
                    // End of Categories of places
                }
                .presentationDetents([.fraction(0.3), .fraction(0.8)])
                .presentationDragIndicator(.visible)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            }
            
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

//struct SheetDragLine: View {
//    var body: some View {
//        HStack {
//            Spacer()
//            Rectangle()
//                .foregroundStyle(.gray)
//                .frame(width: 100, height: 5)
//            Spacer()
//        }
//        .padding(.bottom, 20)
//    }
//}
