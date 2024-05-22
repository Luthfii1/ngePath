//
//  JustifyMappingComponent.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct JustifyMappingComponent<T: Mappable>: View {
    var objects: [T]
    @Binding var setCategory: [String]
    var isJustifyBetween: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: isJustifyBetween ? 0 : 20) {
            ForEach(objects.indices, id: \.self) { index in
                Category(logo: objects[index].logo, name: objects[index].name, setCategory: $setCategory)
                
                if index != objects.indices.last && isJustifyBetween {
                    Spacer()
                }
            }
        }
        .padding()
    }
}


#Preview {
    JustifyMappingComponent(objects: sampleCategories, setCategory: .constant(["Banten"]), isJustifyBetween: false)
}
