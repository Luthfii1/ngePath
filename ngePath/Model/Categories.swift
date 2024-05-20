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

let sampleCategories = [
    Categories(logo: "cup.and.saucer.fill", name: "Coffeeshop"),
    Categories(logo: "fork.knife", name: "Restaurant"),
    Categories(logo: "bird.fill", name: "Public Space"),
    Categories(logo: "books.vertical.fill", name: "Library")
]
