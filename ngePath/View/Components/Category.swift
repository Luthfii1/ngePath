//
//  Category.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI

struct Category: View {
    @EnvironmentObject private var vm: LocationViewModel
    var logo: String
    var name: String
    @Binding var setCategory: [String]
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button {
            //            check the setCategory has already save the name or not
            if !vm.boolState.isOpenedDetailPlace{
                if setCategory.contains(name) {
                    setCategory.removeAll { $0 == name }
                    isPressed = false
                } else {
                    setCategory.append(name)
                    isPressed = true
                }
            }
        } label: {
            VStack (alignment: .center, spacing: 5) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(
                        vm.boolState.isOpenedDetailPlace
                        ? (vm.selectedItem.category.name.rawValue == name
                           ? .white
                           : Color.primaryPink)
                        : (isPressed
                           ? .white
                           : Color.primaryPink)
                    )
                    .padding()
                    .background(
                        vm.boolState.isOpenedDetailPlace
                        ? (vm.selectedItem.category.name.rawValue == name
                           ? Color.primaryPink
                           : Color.secondaryPink)
                        :
                            (isPressed
                             ? Color.primaryPink
                             : Color.secondaryPink))
                    .clipShape(Circle())
                
                Text(name.uppercasedFirstLetter.spacedUppercased)
                    .font(.subheadline)
                    .foregroundStyle(
                        vm.boolState.isOpenedDetailPlace
                        ? (vm.selectedItem.category.name.rawValue == name
                           ? Color.primaryPink : .black)
                        :
                            (isPressed ?
                             Color.primaryPink : .black))
            }
        }
    }
}

#Preview {
    Category(logo: "bird.fill", name: "n", setCategory: .constant(["Burung"]))
        .environmentObject(LocationManager())
}
