//
//  SampleDatas.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 21/05/24.
//

import Foundation
import CoreLocation

let sampleCategories = [
    Categories(name: .coffeeshop),
    Categories(name: .restaurant),
    Categories(name: .publicSpace),
    Categories(name: .library)
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
               category: Categories(name: .restaurant), isFavorite: true, address: "Jl. Raya Serpong Kilometer 7, Lengkong Karya, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15310"),
    
    SavePlaces(name: "RM Putra Minang",
               coordinate: CLLocationCoordinate2D(latitude: -6.2678867649371455, longitude: 106.66154978482874),
               category: Categories(name: .restaurant), isFavorite: true, address: "blok p2 no 24, Jl. Villa Melati Mas Raya No.24 Blok P2, RT.39/RW.9, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15323"),
    
    SavePlaces(name: "Bakso Big Top",
               coordinate: CLLocationCoordinate2D(latitude: -6.26769480026357, longitude: 106.65556309443566),
               category: Categories(name: .restaurant), address: "Jl. Bougenville No.B10 47, RT.50/RW.8, Jelupang, Serpong Utara, South Tangerang City, Banten 15310"),
    
    SavePlaces(name: "Point cafe Serpong",
               coordinate: CLLocationCoordinate2D(latitude: -6.259056316873841, longitude: 106.6532456659641),
               category: Categories(name: .coffeeshop), address: "Jl. Melati 12-18, Pd. Jagung, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15326"),
    
    SavePlaces(name: "Blackship Coffee",
               coordinate: CLLocationCoordinate2D(latitude: -6.262810471003251, longitude: 106.66860537086288),
               category: Categories(name: .coffeeshop), isFavorite: true, address: "Gg. Anjok No.4, RT.2/RW.1, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan, Banten 15323")
]
