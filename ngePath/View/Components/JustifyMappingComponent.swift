//
//  JustifyMappingComponent.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct JustifyMappingComponent<T: Mappable>: View {
    var objects: [T]
    @Binding var setCategory: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(objects.indices, id: \.self) { index in
                Category(logo: objects[index].logo, name: objects[index].name, setCategory: $setCategory)
                
                if index != objects.indices.last {
                    Spacer()
                }
            }
        }
        .padding()
    }
}


#Preview {
    JustifyMappingComponent(objects: sampleCategories, setCategory: .constant("Restaurant"))
}
