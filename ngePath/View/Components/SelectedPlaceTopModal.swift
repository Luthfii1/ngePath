//
//  SelectedPlaceTopModal.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct SelectedPlaceTopModal: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, content: {
                Image(systemName: vm.selectedItem.category.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.primaryPink)
                
                Text(vm.selectedItem.name)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 4)
                
                Spacer()
                
                Button(action: {
                    vm.toggleOpenPlace()
                }, label: {
                    Text("See More")
                        .foregroundStyle(Color.primaryPink)
                        .padding()
                        .background(Color.secondaryPink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            })
            .padding()
            .padding(.horizontal, 20)
            .background(.white)
            .frame(maxWidth: geometry.size.width * 0.4)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
    }
}

#Preview {
    SelectedPlaceTopModal()
}
