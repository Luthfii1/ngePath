//
//  DetailSheet.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct DetailSheet: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
    }
}

#Preview {
    DetailSheet(text: "Hallo")
}
