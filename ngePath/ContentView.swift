//
//  ContentView.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if UIDevice.isIpad {
            MapView()
        } else {
            MapView()
        }
    }
}

#Preview {
    ContentView()
}
