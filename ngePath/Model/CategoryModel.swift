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

class CategoryModel {
    var logo: String
    var name: CategoryType
    
    init(name: CategoryType) {
        self.logo = CategoryModel.logoForCategory(name)
        self.name = name
    }
    
    static func logoForCategory(_ name: CategoryType) -> String {
        switch name {
        case .coffeeshop:
            return "cup.and.saucer.fill"
        case .restaurant:
            return "fork.knife"
        case .publicSpace:
            return "bird.fill"
        case .library:
            return "books.vertical.fill"
        }
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
