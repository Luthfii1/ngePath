//
//  DetailSheet.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 20/05/24.
//

import SwiftUI
import MapKit

struct DraggableSheetView: View {
    @State private var isExpanded: Bool = false
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.85
    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    private let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var keyboardHeight: CGFloat = 0
    
    // Data Important
    @Binding var result : [MKMapItem]
    @State private var textSearch: String = ""
    @State private var categories: [Categories] = sampleCategories
    @Binding var setCategory: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    SheetDragLine()
                    TextFieldInput(placeholder: "Search Place Here", isSearching: true, searchResult: $textSearch)
                        .padding(.vertical, 10)
                        .onSubmit (of: .text) {
                            Task {
                                result = await searchPlace(text: textSearch)
                                // Reset sheet height
                                self.offset = self.maxHeight
                                self.isExpanded = false
                                
                                print(result)
                            }
                        }
                        .onTapGesture {
                            self.offset = self.minHeight
                            self.isExpanded = true
                        }
                    
                    if isExpanded {
                        VStack {
                            // Categories of places
                            VStack (alignment: .leading) {
                                Title(text: "Categories")
                                    .font(.title)
                                JustifyMappingComponent(objects: categories, setCategory: $setCategory, isJustifyBetween: true)
                            }
                            
                            // Favorite Places
                            VStack (alignment: .leading) {
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
                                self.isExpanded = true
                            } else {
                                self.offset = self.maxHeight
                                self.isExpanded = false
                            }
                        }
                )
                .animation(.interactiveSpring(), value: offset)
            }
            .padding()
        }
//        .background(Color.black.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    DraggableSheetView(result: .constant([]), setCategory: .constant(""))
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

