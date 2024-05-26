//
//  ScrollableImages.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 25/05/24.
//

import SwiftUI

struct ScrollableImages: View {
    @State private var photos: [Gallery] = sampleGalleries
    @State private var isShowingImage: Bool = false
    var story: Bool
    var limitImages: Int?
    var gallery: Bool
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        // Determine the source of images
        let sourcePhotos: [Gallery] = gallery ? vm.getAllImagesStory(isStory: story) : photos
        let imageLimit = limitImages ?? sourcePhotos.count
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12 ) {
                ForEach(Array(sourcePhotos.prefix(imageLimit).enumerated()), id: \.element.name) { index, photo in
                    Button(action: {
                        print(photo.logo)
                        if !story {
                            isShowingImage = true
                        }
                    }, label: {
                        VStack(alignment: .leading) {
                            ZStack {
                                Image(photo.logo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill) // Ensure the image fills the frame
                                    .frame(width: 100, height: 100) // Set a fixed size for the image
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.bottom, 4) // Add padding to separate image from text
                                
                                if index == imageLimit - 1, sourcePhotos.count > imageLimit {
                                    Text("+\(sourcePhotos.count - imageLimit)")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .shadow(radius: 10)
                                        .background(Color.black.opacity(0.7))
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .padding(8) // Add padding to make the indicator more visible
                                        .offset(y: 30) // Adjust vertical position of the indicator
                                }
                            }
                            
                            if story {
                                if let story = vm.selectedItem.stories?.first(where: { $0.images?.contains(where: { $0.name == photo.name }) == true }) {
                                    Text(story.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                    
                                    Text(story.title)
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.black)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        .fullScreenCover(isPresented: $isShowingImage) {
                            SelectImage(imageName: photo.logo, isShowingImage: $isShowingImage)
                        }
                        .frame(width: 120)
                    })
                }
                
                if story {
                    Button(action: {
                        // Handle "See More" action
                    }, label: {
                        VStack(alignment: .center) {
                            Image(systemName: "chevron.right")
                                .font(.largeTitle)
                                .padding(.bottom, 5)
                            
                            Text("See More")
                                .font(.callout)
                        }
                    })
                    .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ScrollableImages(story: true, limitImages: 6, gallery: true)
        .environmentObject(LocationViewModel())
}
