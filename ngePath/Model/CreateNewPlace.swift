//
//  CreateNewPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import Foundation

class CreateNewPlaceModel: ObservableObject {
    var textSearch: String
    var placeName: String
    var storyTitle: String
    var storyDescription: String
    var isFavorite: Bool
    @Published var setPlaceName: String
    
    init(textSearch: String = "", placeName: String = "Unknown Location", storyTitle: String = "", storyDescription: String = "", replaceName: String = "", isFavorite: Bool = false) {
        self.textSearch = textSearch
        self.placeName = placeName
        self.storyTitle = storyTitle
        self.storyDescription = storyDescription
        self.setPlaceName = placeName
        self.isFavorite = isFavorite
    }
}
