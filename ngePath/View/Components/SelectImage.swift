//
//  SelectImage.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 26/05/24.
//

import SwiftUI

struct SelectImage: View {
    var imageName: String
    @Binding var isShowingImage: Bool
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                isShowingImage.toggle()
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
        .onAppear(perform: {
            print(imageName)
        })
    }
}

#Preview {
    SelectImage(imageName: "image1", isShowingImage: .constant(false))
}
