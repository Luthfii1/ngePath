//
//  JustifyMappingComponent.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct JustifyMappingComponent<T: Mappable>: View {
    var objects: [T]
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            ForEach (objects , id: \.name) { object in
                Spacer()
                Category(logo: object.logo, name: object.name)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    JustifyMappingComponent(objects: sampleCategories)
}
