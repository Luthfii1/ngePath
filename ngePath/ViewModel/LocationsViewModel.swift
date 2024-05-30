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
    // Map Variable
    @Published var selectedItem: SavePlaces {
        didSet {
            withAnimation(.easeInOut) {
                let newRegion = MKCoordinateRegion(center: selectedItem.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                mapCamera = MapCameraPosition.region(newRegion)
            }
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var mapCamera: MapCameraPosition
    
    // State Variable
    @Published var state: VarStateModel {
        didSet {
            filterPlaces()
        }
    }
    @Published var boolState: BoolStateModel
    
    // sampleResult
    @Published var sampleResult: [SavePlaces]
    // Categories
    @Published var categories: [CategoryModel]
    // Create newInput
    @Published var inputUser: CreateNewPlaceModel {
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
        
        self.state = VarStateModel()
        self.boolState = BoolStateModel()
        
        self.sampleResult = sampleSavePlaces
        self.categories = sampleCategories
        self.inputUser = CreateNewPlaceModel()
        
        self.filterPlaces()
    }
    
    func setSelectedImage(image: String) {
        state.selectedImage = image
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
        inputUser.setPlaceName = ""
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
    
    func inputState() -> String {
        return state.inputCase.rawValue.lowercased()
    }
}
