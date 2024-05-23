//
//  String+Extension.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 23/05/24.
//

import SwiftUI

extension String {
    var uppercasedFirstLetter: String {
        guard let firstLetter = self.first else {
            return ""
        }
        return String(firstLetter).uppercased() + dropFirst()
    }
    
    var spacedUppercased: String {
        var result = ""
        for char in self {
            if char.isUppercase {
                result += " " + String(char)
            } else {
                result += String(char)
            }
        }
        return result
    }
}
