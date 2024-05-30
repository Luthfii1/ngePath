//
//  SearchButton.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct TextFieldInput: View {
    @EnvironmentObject private var vm: LocationViewModel
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<Place>
    var placeholder: String
    var isSearching: Bool
    var input: String {
        if isSearching {
            return vm.inputUser.textSearch
        } else {
            return vm.inputUser.setPlaceName
        }
    }
    
    var body: some View {
        HStack {
            if isSearching {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
            
            TextField(placeholder, text: isSearching ? $vm.inputUser.textSearch : $vm.inputUser.setPlaceName, axis: .vertical)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.vertical, 2)
                .onChange(of: vm.inputUser.textSearch) { oldValue, newValue in
                    vm.filterPlaces()
                }
                .onChange(of: vm.inputUser.setPlaceName) { oldValue, newValue in
                    vm.inputUser.setPlaceName = newValue
                }
            
            Spacer()
            
            if !input.isEmpty {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        vm.cleanSearch()
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
