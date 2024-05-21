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

let sampleCategories = [
    Categories(logo: "cup.and.saucer.fill", name: "Coffeeshop"),
    Categories(logo: "fork.knife", name: "Restaurant"),
    Categories(logo: "bird.fill", name: "Public Space"),
    Categories(logo: "books.vertical.fill", name: "Library")
]

let sampleFavPlaces: [FavPlaces] = [
    FavPlaces(placeName: "Central Perk", placeDetail: "Iconic coffee shop", category: sampleCategories[0]),
    FavPlaces(placeName: "La Trattoria", placeDetail: "Cozy Italian restaurant", category: sampleCategories[1]),
    FavPlaces(placeName: "Central Park", placeDetail: "Popular public space", category: sampleCategories[2]),
    FavPlaces(placeName: "City Library", placeDetail: "Large community library", category: sampleCategories[3])
]
