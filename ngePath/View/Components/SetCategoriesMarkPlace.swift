//
//  SetCategoriesMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct SetCategoriesMarkPlace: View {
    var body: some View {
        VStack (alignment: .leading) {
            Title(text: "Categories")
                .font(.title)
            JustifyMappingComponent( isJustifyBetween: false)
        }
    }
}

#Preview {
    SetCategoriesMarkPlace()
}
