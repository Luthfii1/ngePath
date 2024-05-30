//
//  DummySetImagesMarkPlace.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 27/05/24.
//

import SwiftUI

struct DummySetImagesMarkPlace: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Images")
                .font(.headline)
                .padding(.vertical, 2)
            
            Text("3 Images Uploaded")
                .font(.caption)
                .foregroundStyle(Color.secondaryPink.opacity(10))
                .padding(.vertical, 2)
            
            HStack (alignment: .center){
                Button(action: {
                    //                    print("Images")
                }, label: {
                    Image(systemName: "photo.stack")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.primaryPink)
                        .padding()
                        .background(Color.secondaryPink)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                })
                
                Divider()
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                
                ScrollableImages(story: false, gallery: false)
            }
        }
    }
}

#Preview {
    DummySetImagesMarkPlace()
}
