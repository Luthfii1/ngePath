//
//  SampleDatas.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import Foundation
import CoreLocation

let sampleCategories = [
    CategoryModel(name: .coffeeshop),
    CategoryModel(name: .restaurant),
    CategoryModel(name: .publicSpace),
    CategoryModel(name: .library)
]

let sampleGalleries: [Gallery] = [
    Gallery(logo: "nano2_1", name: "Coffeshop1"),
    Gallery(logo: "nano2_2", name: "Coffeshop2"),
    Gallery(logo: "nano2_3", name: "Coffeshop3"),
    Gallery(logo: "nano2_4", name: "Coffeshop4"),
    Gallery(logo: "nano2_5", name: "Coffeshop5")
]

let sampleStories = [
    Story(
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 12))!,
        title: "Amazing Experience",
        description: "The food was delicious and the atmosphere was cozy.",
        images: [
            Gallery(logo: "image1", name: "image1"),
            Gallery(logo: "image2", name: "image2")
        ]
    ),
    
    Story(
        date: Date(),
        title: "Family Dinner",
        description: "Had a great time with the family, highly recommend!",
        images: [
            Gallery(logo: "image3", name: "image3"),
            Gallery(logo: "image4", name: "image4")
        ]
    ),
    
    Story(
        date: Date(),
        title: "Coffee Time",
        description: "Best coffee in town, great place to work or relax.",
        images: [Gallery(logo: "image5", name: "image5")]
    )
]

let sampleSavePlaces = [
    SavePlaces(
        name: "Ayam Mercon",
        coordinate: CLLocationCoordinate2D(latitude: -6.27604446236087, longitude: 106.66258838033295),
        category: CategoryModel(name: .restaurant),
        rate: 4.5,
        isFavorite: true,
        address: "Jl. Raya Serpong Kilometer 7, Lengkong Karya, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15310",
        stories: [sampleStories[0], sampleStories[1]]
    ),
    
    SavePlaces(
        name: "RM Putra Minang",
        coordinate: CLLocationCoordinate2D(latitude: -6.2678867649371455, longitude: 106.66154978482874),
        category: CategoryModel(name: .restaurant),
        rate: 4.7,
        isFavorite: true,
        address: "blok p2 no 24, Jl. Villa Melati Mas Raya No.24 Blok P2, RT.39/RW.9, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15323",
        stories: [sampleStories[1], sampleStories[2], sampleStories[0]]
    ),
    
    SavePlaces(
        name: "Bakso Big Top",
        coordinate: CLLocationCoordinate2D(latitude: -6.26769480026357, longitude: 106.65556309443566),
        category: CategoryModel(name: .restaurant),
        rate: 4.3,
        address: "Jl. Bougenville No.B10 47, RT.50/RW.8, Jelupang, Serpong Utara, South Tangerang City, Banten 15310",
        stories: [sampleStories[0], sampleStories[2]]
    ),
    
    SavePlaces(
        name: "Point cafe Serpong",
        coordinate: CLLocationCoordinate2D(latitude: -6.259056316873841, longitude: 106.6532456659641),
        category: CategoryModel(name: .coffeeshop),
        rate: 3.9,
        address: "Jl. Melati 12-18, Pd. Jagung, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15326",
        stories: [sampleStories[2]]
    ),
    
    SavePlaces(
        name: "Blackship Coffee",
        coordinate: CLLocationCoordinate2D(latitude: -6.262810471003251, longitude: 106.66860537086288),
        category: CategoryModel(name: .coffeeshop),
        rate: 4.8,
        isFavorite: true,
        address: "Gg. Anjok No.4, RT.2/RW.1, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15323",
        stories: [sampleStories[1]]
    )
]
