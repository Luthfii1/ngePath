//
//  Sidebar.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 16/05/24.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: ContentView()) {
                Label("dash", systemImage: "square.dashed")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            
            NavigationLink(destination: ContentView()) {
                Label("About", systemImage: "info")
            }
        }
    }
}

#Preview {
    Sidebar()
}
