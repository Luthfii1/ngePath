//
//  LocationMapAnnotationView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 24/05/24.
//

import SwiftUI
import MapKit

struct LocationMapAnnotationView: View {
    @EnvironmentObject private var vm: LocationViewModel
    var name: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.primaryPink)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.primaryPink)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
//                .padding(.bottom, 40)
            
            Text(name)
                .font(.title3)
                .foregroundStyle(.black)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            LocationMapAnnotationView(name: "Rujak")
                .environmentObject(LocationViewModel())
        }
    }
}
