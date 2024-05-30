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
    @StateObject private var locationManager = LocationManagerViewModel()
//    @StateObject var coreData = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            LandingPageView(isLoading: false)
                .environmentObject(vm)
                .environmentObject(locationManager)
//                .environment(\.managedObjectContext, coreData.container.viewContext)
        }
    }
}
