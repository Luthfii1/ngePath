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
    @State private var setCategory: String = ""
    
    @State private var textSearch: String = ""
    
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
                        print("Hai")
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
