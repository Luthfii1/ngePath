//
//  ScrollableImages.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 25/05/24.
//

import SwiftUI

struct ScrollableImages: View {
    @State private var photos: [Gallery] = sampleGalleries
    var story: Bool
    var limitImages: Int?
    var gallery: Bool
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        // Determine the source of images
        let sourcePhotos: [Gallery] = gallery ? vm.getAllImagesStory(isStory: story) : photos
        let imageLimit = limitImages ?? sourcePhotos.count
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                HStack(alignment: .top, spacing: 16 ) {
                    ForEach(Array(sourcePhotos.prefix(imageLimit).enumerated()), id: \.element.name) { index, photo in
                        Button(action: {
                            if !story {
                                vm.setSelectedImage(image: photo.logo)
                                vm.boolState.isShowingImage = true
                            }
                        }, label: {
                            VStack(alignment: .leading) {
                                ZStack {
                                    Image(photo.logo)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill) // Ensure the image fills the frame
                                        .frame(width: 135, height: 135) // Set a fixed size for the image
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.bottom, 4) // Add padding to separate image from text
                                    
                                    if index == imageLimit - 1, sourcePhotos.count > imageLimit {
                                        Text("+\(sourcePhotos.count - imageLimit)")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .shadow(radius: 10)
                                            .background(Color.black.opacity(0.7))
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(8) // Add padding to make the indicator more visible
                                            .offset(y: 10) // Adjust vertical position of the indicator
                                    }
                                }
                                
                                if story {
                                    if let story = vm.selectedItem.stories?.first(where: { $0.images?.contains(where: { $0.name == photo.name }) == true }) {
                                        Text(story.date, style: .date)
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                            .padding(.top, 8)
                                        
                                        Text(story.title)
                                            .font(.title3)
                                            .bold()
                                            .foregroundStyle(.black)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                            .frame(width: 135)
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                
                if story {
                    Button(action: {
                        // Handle "See More" action
                    }, label: {
                        VStack(alignment: .center) {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.primaryPink)
                                .font(.system(size: 50))
                                .bold()
                                .padding(.bottom, 5)
                            
                            Text("See More")
                                .font(.callout)
                                .foregroundStyle(Color.secondaryPink)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
        .fullScreenCover(isPresented: $vm.boolState.isShowingImage) {
            SelectImage()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ScrollableImages(story: true, limitImages: 6, gallery: true)
        .environmentObject(LocationViewModel())
}
