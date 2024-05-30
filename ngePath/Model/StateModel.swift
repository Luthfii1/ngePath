//
//  State.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import Foundation

class VarStateModel: ObservableObject {
    @Published var setCategory: [String]
    @Published var searchResult: [SavePlaces]
    @Published var selectedImage: String
    @Published var inputCase: InputCase
    
    init(setCategory: [String] = [], searchResult: [SavePlaces] = [], selectedImage: String = "", inputCase: InputCase = .TITLE) {
        self.setCategory = setCategory
        self.searchResult = searchResult
        self.selectedImage = selectedImage
        self.inputCase = inputCase
    }
}

struct BoolStateModel {
    var isFavPlace: Bool = false
    var isMarkPlace: Bool = false
    var isExpandedBottomSheet: Bool = false
    var isOpenedDetailPlace: Bool = false
    var showMap: Bool = false
    var isShowingImage: Bool = false
}

enum InputCase: String {
    case SEARCH, CURRENTLOCATION, TITLE, DESCRIPTION
}
