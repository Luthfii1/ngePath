//
//  SelectImage.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 26/05/24.
//

import SwiftUI

struct SelectImage: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Image(vm.state.selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                vm.boolState.isShowingImage.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .padding(20) // Add more padding
                    .background(Color.black.opacity(0.5))
                    .clipShape(Circle())
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 50)
        }
        .background(.black)
    }
}

#Preview {
    SelectImage()
}
