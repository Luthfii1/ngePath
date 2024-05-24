//
//  State.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import Foundation

class VarState: ObservableObject {
    @Published var setCategory: [String]
    @Published var searchResult: [SavePlaces]
    
    init(setCategory: [String] = [], searchResult: [SavePlaces] = []) {
        self.setCategory = setCategory
        self.searchResult = searchResult
    }
}

struct BoolState {
    var isFavPlace: Bool = false
    var isMarkPlace: Bool = false
    var isExpandedBottomSheet: Bool = false
}
