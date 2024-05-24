//
//  ngePathApp.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 15/05/24.
//

import SwiftUI

@main
struct ngePathApp: App {
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            MapView()
                .environmentObject(vm)
        }
    }
}
