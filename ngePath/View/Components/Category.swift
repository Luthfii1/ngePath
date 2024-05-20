//
//  Category.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct Category: View {
    var logo: String
    var name: String
    
    var body: some View {
        VStack (alignment: .center, spacing: 5) {
            Image(systemName: logo)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .clipShape(Circle())
            
            Text(name)
                .font(.subheadline)
        }
    }
}

#Preview {
    Category(logo: "bird.fill", name: "Burung")
}
