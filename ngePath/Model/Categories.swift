//
//  Categories.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import Foundation

protocol Mappable {
    var logo: String { get }
    var name: String { get }
}

class Categories: Mappable {
    var logo: String
    var name: String
    
    init(logo: String, name: String) {
        self.logo = logo
        self.name = name
    }
}

class FavPlaces {
    var placeName: String
    var placeDetail: String
    var category: Categories
    
    init(placeName: String, placeDetail: String, category: Categories) {
        self.placeName = placeName
        self.placeDetail = placeDetail
        self.category = category
    }
}

class Gallery: Mappable {
    var logo: String
    var name: String
    
    init(logo: String, name: String) {
        self.logo = logo
        self.name = name
    }
}
