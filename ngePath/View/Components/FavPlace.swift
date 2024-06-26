//
//  FavPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import SwiftUI

struct FavPlace: View {
    @EnvironmentObject private var vm: LocationViewModel
    var logo: String
    var loctName: String
    var loctPreview: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center, spacing: 15) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.primaryPink)
                    .padding()
                    .background(Color.secondaryPink)
                    .clipShape(Circle())
                
                VStack (alignment: .leading) {
                    Text(loctName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text(loctPreview)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    FavPlace(logo: "cup.and.saucer.fill", loctName: "Kopi Nako BSD", loctPreview: "Jl. Pagedangan, BSD, South Tangerang")
        .environmentObject(LocationViewModel())
}
