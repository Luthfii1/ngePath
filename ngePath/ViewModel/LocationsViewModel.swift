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
    @Published var mapLocation: SavePlaces
    // Set mapRegion
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    // set mapCamera
    @Published var mapCamera: MapCameraPosition
    // set mapSelection
    @Published var mapSelection: MKMapItem?
    
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
    
    init() {
        self.mapLocation = sampleSavePlaces.first!
        self.mapRegion = .userRegion
        self.mapCamera = .region(.userRegion)
        
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
    
    func toggleFavPlace() {
        boolState.isFavPlace.toggle()
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
        
        print("searchResult: ", locations)
        
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
}
