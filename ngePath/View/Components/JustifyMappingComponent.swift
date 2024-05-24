//
//  JustifyMappingComponent.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct JustifyMappingComponent: View {
    @EnvironmentObject private var vm: LocationViewModel
    var isJustifyBetween: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: isJustifyBetween ? 0 : 20) {
            ForEach(vm.categories.indices, id: \.self) { index in
                Category(logo: vm.categories[index].logo, name: vm.categories[index].name.rawValue, setCategory: $vm.state.setCategory)
                
                if index != vm.categories.indices.last && isJustifyBetween {
                    Spacer()
                }
            }
        }
        .padding()
    }
}


#Preview {
    JustifyMappingComponent(isJustifyBetween: false)
        .environmentObject(LocationViewModel())
}
