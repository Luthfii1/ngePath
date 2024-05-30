//
//  SetRatingMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct SetRatingMarkPlace: View {
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
                        .foregroundStyle(Color.primaryPink)
                }
            }
            .padding(.top, 4)
        }
    }
}

#Preview {
    SetRatingMarkPlace()
}
