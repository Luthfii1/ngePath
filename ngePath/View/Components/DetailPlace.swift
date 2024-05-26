//
//  DetailPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import SwiftUI

struct DetailPlace: View {
    @State private var selectedStar: Int = 0
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderSheet(isCreate: false)
                .padding(6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Your Gallery")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 20)
                    ScrollableImages(story: false, limitImages: 3, gallery: true)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                }
                
                VStack(alignment: .leading) {
                    Text("Average Rate")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    HStack(alignment: .center) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(maxWidth: 60, maxHeight: 60)
                            .foregroundStyle(Color.primaryBlue)
                        
                        Text(String(vm.selectedItem.rate))
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal, 4)
                    }
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity)
            
            Text("Categories")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top, 20)
            JustifyMappingComponent( isJustifyBetween: false)
                .padding(.horizontal)
            
            Text("See Your Story")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top, 40)
            ScrollableImages(story: true, gallery: true)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    DetailPlace()
        .environmentObject(LocationViewModel())
}
