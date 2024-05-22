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
    @Binding var setCategory: [String]
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button {
//            check the setCategory has already save the name or not
            if setCategory.contains(name) {
                setCategory.removeAll { $0 == name }
                isPressed = false
            } else {
                setCategory.append(name)
                isPressed = true
            }
            
//            if setCategory.contains(name){
//                isPressed = true
//            } else {
//                isPressed = false
//            }
        } label: {
            VStack (alignment: .center, spacing: 5) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(isPressed ? 
                        .white : Color("PrimaryBlue"))
                    .padding()
                    .background(isPressed ? 
                                Color("BGButtonPressed") : Color("SecondaryBlue"))
                    .clipShape(Circle())
                
                Text(name)
                    .font(.subheadline)
                    .foregroundStyle(isPressed ? 
                                     Color("PrimaryBlue") : .black)
            }
        }
    }
}

func isCategoryPressed(setCategory: String, name: String) -> Bool {
    return setCategory == name
}

#Preview {
    Category(logo: "bird.fill", name: "n", setCategory: .constant(["Burung"]))
}
