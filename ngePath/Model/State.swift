//
//  State.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import Foundation

class VarState : ObservableObject {
    @Published var isFavPlace: Bool
    @Published var isSetPlace: Bool
    @Published var setCategory: [String]
    @Published var searchResult: [SavePlaces]
    
    init(isFavPlace: Bool = false, isSetPlace: Bool = false, setCategory: [String] = [], searchResult: [SavePlaces] = []) {
        self.isFavPlace = isFavPlace
        self.isSetPlace = isSetPlace
        self.setCategory = setCategory
        self.searchResult = searchResult
    }
}
