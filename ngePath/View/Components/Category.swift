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
    @Binding var setCategory: String
    
    var body: some View {
        Button {
            print(name)
            setCategory = name
        } label: {
            VStack (alignment: .center, spacing: 5) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(isCategoryPressed(setCategory: setCategory, name: name) ? .white : Color("PrimaryBlue"))
                    .padding()
                    .background(isCategoryPressed(setCategory: setCategory, name: name) ? Color("BGButtonPressed") : Color("SecondaryBlue"))
                    .clipShape(Circle())
                
                Text(name)
                    .font(.subheadline)
                    .foregroundStyle(isCategoryPressed(setCategory: setCategory, name: name) ? Color("PrimaryBlue") : .black)
            }
        }
    }
}

func isCategoryPressed(setCategory: String, name: String) -> Bool {
    return setCategory == name
}

#Preview {
    Category(logo: "bird.fill", name: "n", setCategory: .constant("Burung"))
}
