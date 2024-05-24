//
//  CreateNewPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import Foundation

class CreateNewPlace {
    var textSearch: String
    var placeName: String
    var storyTitle: String
    var storyDescription: String
    
    init(textSearch: String = "", placeName: String = "", storyTitle: String = "", storyDescription: String = "") {
        self.textSearch = textSearch
        self.placeName = placeName
        self.storyTitle = storyTitle
        self.storyDescription = storyDescription
    }
}
