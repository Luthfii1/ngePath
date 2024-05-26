//
//  LocationsViewModel.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 24/05/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    // Set mapLocation
    @Published var selectedItem: SavePlaces {
        didSet {
            withAnimation(.easeInOut) {
                let newRegion = MKCoordinateRegion(center: selectedItem.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                mapCamera = MapCameraPosition.region(newRegion)
            }
        }
    }
    // Set mapRegion
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    // set mapCamera
    @Published var mapCamera: MapCameraPosition
    // showMap
    @Published var showMap: Bool
    
    // State Var
    @Published var state: VarState {
        didSet {
            filterPlaces()
        }
    }
    // Bool State
    @Published var boolState: BoolState
    
    // sampleResult
    @Published var sampleResult: [SavePlaces]
    // Categories
    @Published var categories: [Categories]
    // Create newInput
    @Published var inputUser: CreateNewPlace {
        didSet {
            filterPlaces()
        }
    }
    // Filtered Places
    @Published var filteredPlaces: [SavePlaces] = []
    @Published var imagesStory: [String] = []
    init() {
        self.selectedItem = sampleSavePlaces.first!
        self.mapRegion = .userRegion
        self.mapCamera = .region(.userRegion)
        self.showMap = false
        
        self.state = VarState()
        self.boolState = BoolState()
        
        self.sampleResult = sampleSavePlaces
        self.categories = sampleCategories
        self.inputUser = CreateNewPlace()
        
        self.filterPlaces()
    }
    
    func toggleMarkPlace() {
        boolState.isMarkPlace.toggle()
    }
    
    func toggleFavPlace(create: Bool) {
        create ? boolState.isFavPlace.toggle() : selectedItem.isFavorite.toggle()
    }
    
    func toggleOpenPlace() {
        boolState.isOpenedDetailPlace.toggle()
    }
    
    func getAllImagesStory(isStory: Bool) -> [Gallery] {
        var galleryImages: [Gallery] = []
        var seenTitles: Set<String> = Set()
        
        // Iterate through stories and images
        if let stories = selectedItem.stories {
            for story in stories {
                if (isStory) {
                    if let images = story.images, !seenTitles.contains(story.title) {
                        if let firstImage = images.first {
                            galleryImages.append(firstImage)
                            seenTitles.insert(story.title)
                        }
                    }
                } else {
                    if let images = story.images {
                        galleryImages.append(contentsOf: images)
                    }
                }
            }
        }
        
        return galleryImages
    }
    
    func cleanSearch() {
        inputUser.textSearch = ""
        state.searchResult = []
        filterPlaces()
    }
    
    func setExpanded(state: Bool) {
        boolState.isExpandedBottomSheet = state
    }
    
    func filterPlaces() {
        var result: [SavePlaces] = []
        let locations = inputUser.textSearch.isEmpty ? sampleResult : sampleResult.filter { $0.name.lowercased().contains(inputUser.textSearch.lowercased()) }
        let category = state.setCategory
        
        //        print("searchResult: ", locations)
        
        if category.isEmpty {
            filteredPlaces = locations
            return
        }
        
        for location in locations {
            if category.contains(where: { $0.lowercased() == location.category.name.rawValue.lowercased() }) {
                result.append(location)
            }
        }
        
        filteredPlaces = result
    }
    
    //    func getAllImagesStory(isGallery: Bool) -> Gallery {
    //        if isGallery {
    //            guard let stories = selectedItem.stories else {
    //                return Gallery(logo: "", name: "") // Return an empty Gallery if stories is nil
    //            }
    //            let images = stories.compactMap { $0.images }.flatMap { $0 }
    //            // Assuming you want to return the first image as logo and "All Images" as name
    //            let logo = images
    //            return Gallery(logo: logo, name: "All Images")
    //        } else {
    //            return sampleGalleries // Return sampleGalleries if it's not a gallery
    //        }
    //    }
}
