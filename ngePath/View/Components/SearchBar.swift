//
//  SearchButton.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct SearchBar: View {
    var placeholder: String
    @State private var searchResult = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
                TextField(placeholder, text: $searchResult)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(.vertical, 2)
            
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
            Capsule()
                .stroke(lineWidth: 2)
                .foregroundStyle(Color(.systemGray))
        }
        .padding(.horizontal,2)
        .padding(.bottom, 10)
    }
}

#Preview {
    SearchBar(placeholder: "Search your product")
}
