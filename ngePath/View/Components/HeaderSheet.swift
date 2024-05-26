//
//  HeaderSheet.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 24/05/24.
//

import SwiftUI

struct HeaderSheet: View {
    @EnvironmentObject private var vm: LocationViewModel
    var isCreate: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    isCreate ? vm.toggleMarkPlace() : vm.toggleOpenPlace()
                    isCreate ? print(vm.boolState.isMarkPlace) : print("detail: ", vm.boolState.isOpenedDetailPlace)
                }, label: {
                    Text("Cancel")
                        .font(.title3)
                        .foregroundStyle(Color.primaryBlue)
                })
                
                Spacer()
                
                Text(isCreate ? "Add New Place" : vm.selectedItem.name)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                favoriteIcon
            }
            
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: 1)
                    .foregroundColor(.gray)
            }
            .frame(height: 1)
        }
    }
    
    private var favoriteIcon: some View {
        Image(systemName: isCreate ? (vm.boolState.isFavPlace ? "heart.fill" : "heart") : (vm.selectedItem.isFavorite == true ? "heart.fill" : "heart"))
            .foregroundStyle(.primaryBlue)
            .font(.title2)
            .onTapGesture {
                vm.toggleFavPlace(create: isCreate)
            }
    }
}

#Preview {
    HeaderSheet(isCreate: false)
        .environmentObject(LocationViewModel())
}
