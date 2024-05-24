//
//  SearchButton.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct TextFieldInput: View {
    @EnvironmentObject private var vm: LocationViewModel
    var placeholder: String
    var isSearching: Bool
    
    var body: some View {
        HStack {
            if isSearching {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
            
            TextField(placeholder, text: $vm.inputUser.textSearch, axis: .vertical)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.vertical, 2)
                .onChange(of: vm.inputUser.textSearch) { oldValue, newValue in
                    vm.filterPlaces()
                }
            
            Spacer()
            
            if !vm.inputUser.textSearch.isEmpty {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        vm.cleanSearch()
                        print("remove: ", vm.inputUser.textSearch)
                    }
            }
        }
        .padding(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color(.systemGray))
        }
        .padding(.horizontal, 2)
        .padding(.bottom, 10)
    }
}

#Preview {
    TextFieldInput(placeholder: "Search your product", isSearching: false)
        .environmentObject(LocationViewModel())
}
