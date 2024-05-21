//
//  SearchButton.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct TextFieldInput: View {
    var placeholder: String
    var isSearching: Bool
    @Binding var searchResult: String
    
    var body: some View {
        HStack {
            
            if isSearching {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
            
            TextField(placeholder, text: $searchResult, axis: .vertical)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.vertical, 2)
//                .lineLimit(5...10)
            
            Spacer()
            
            //            check if searchResult has value to showing the icon
            if !searchResult.isEmpty {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 5)
                    .onTapGesture {
                        searchResult = ""
                    }
            }
        }
        .padding(10)
        .background(Color("Neutral"))
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color(.systemGray))
        }
        .padding(.horizontal,2)
        .padding(.bottom, 10)
    }
}

#Preview {
    TextFieldInput(placeholder: "Search your product", isSearching: false, searchResult: .constant("")) // Pass a constant empty string
}
