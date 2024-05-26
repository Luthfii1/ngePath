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
    @Published var selectedImage: String
    
    init(setCategory: [String] = [], searchResult: [SavePlaces] = [], selectedImage: String = "") {
        self.setCategory = setCategory
        self.searchResult = searchResult
        self.selectedImage = selectedImage
    }
}

struct BoolState {
    var isFavPlace: Bool = false
    var isMarkPlace: Bool = false
    var isExpandedBottomSheet: Bool = false
    var isOpenedDetailPlace: Bool = false
    var showMap: Bool = false
    var isShowingImage: Bool = false
}
