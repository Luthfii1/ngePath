//
//  DetailSheet.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI
import MapKit

struct DraggableSheetView: View {
    @EnvironmentObject private var vm: LocationViewModel
    @State private var textSearch: String = ""
    
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.85
    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    private let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    SheetDragLine()
                    TextFieldInput(placeholder: "Search Place Here", isSearching: true)
                        .padding(.vertical, 10)
                        .onChange(of: vm.inputUser.textSearch) { oldValue, newValue in
                            print("new val: ", newValue)
                            if !newValue.isEmpty {
                                vm.state.searchResult = vm.sampleResult.filter { $0.name.lowercased().contains(newValue.lowercased()) }
                            } else {
                                vm.state.searchResult = []
                            }
                            vm.filterPlaces()
                        }
                        .onTapGesture {
                            self.offset = self.minHeight
                            vm.setExpanded(state: true)
                        }
                    
                    if vm.boolState.isExpandedBottomSheet {
                        VStack {
                            // Categories of places
                            VStack(alignment: .leading) {
                                Title(text: "Categories")
                                    .font(.title)
                                JustifyMappingComponent(isJustifyBetween: true)
                            }
                            
                            // Favorite Places
                            VStack(alignment: .leading) {
                                Title(text: "My Fav Place")
                                    .font(.title)
                                
                                ListFavPlace()
                                    .padding(10)
                            }
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.3, height: self.maxHeight, alignment: .top)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color("SecondaryBlue").opacity(10), radius: 10)
                .offset(y: self.offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newOffset = value.translation.height + self.offset
                            if newOffset >= minHeight && newOffset <= maxHeight {
                                self.offset = newOffset
                            }
                        }
                        .onEnded { value in
                            if self.offset < (self.maxHeight - self.minHeight) / 2 {
                                self.offset = self.minHeight
                                vm.setExpanded(state: true)
                            } else {
                                self.offset = self.maxHeight
                                vm.setExpanded(state: false)
                            }
                        }
                )
                .animation(.interactiveSpring(), value: offset)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    DraggableSheetView()
        .environmentObject(LocationViewModel())
}

struct SheetDragLine: View {
    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .foregroundStyle(Color("PrimaryBlue"))
                .frame(width: 100, height: 5)
            Spacer()
        }
        .padding(.bottom, 20)
        .foregroundStyle(.black)
    }
}
