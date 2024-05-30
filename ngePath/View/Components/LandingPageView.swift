//
//  LandingPageView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 26/05/24.
//

import SwiftUI

struct LandingPageView: View {
    var isLoading: Bool
    @State private var navigateToMapView: Bool = false
    @EnvironmentObject private var vm: LocationViewModel
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Place>
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("landingPage-ngePath")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                if isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(3)
                        
                        Text("Tunggu sebentar ya babi")
                            .padding(.top, 40)
                    }
                    .padding(.top, 80)
                }
            }
            .navigationDestination(isPresented: $navigateToMapView) {
                MapView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    navigateToMapView = true
                }
            }
        }
    }
}

#Preview {
    LandingPageView(isLoading: false)
        .environmentObject(LocationViewModel())
}
