//
//  SampleDatas.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import Foundation

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

let sampleGalleries: [Gallery] = [
    Gallery(logo: "nano2_1", name: "Coffeshop1"),
    Gallery(logo: "nano2_2", name: "Coffeshop2"),
    Gallery(logo: "nano2_3", name: "Coffeshop3"),
    Gallery(logo: "nano2_4", name: "Coffeshop4"),
    Gallery(logo: "nano2_5", name: "Coffeshop5")
]
