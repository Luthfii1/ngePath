//
//  SampleDatas.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import Foundation
import CoreLocation

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

let sampleSavePlaces = [
    SavePlaces(name: "Ayam Mercon",
               coordinate: CLLocationCoordinate2D(latitude: -6.27604446236087, longitude: 106.66258838033295),
               category: .restaurant),
    
    SavePlaces(name: "RM Putra Minang",
               coordinate: CLLocationCoordinate2D(latitude: -6.2678867649371455, longitude: 106.66154978482874),
               category: .restaurant),
    
    SavePlaces(name: "Bakso Big Top",
               coordinate: CLLocationCoordinate2D(latitude: -6.26769480026357, longitude: 106.65556309443566),
               category: .restaurant),
    
    SavePlaces(name: "Point cafe Serpong",
               coordinate: CLLocationCoordinate2D(latitude: -6.259056316873841, longitude: 106.6532456659641),
               category: .coffeeshop),
    
    SavePlaces(name: "Blackship Coffee",
               coordinate: CLLocationCoordinate2D(latitude: -6.262810471003251, longitude: 106.66860537086288),
               category: .coffeeshop)
]
