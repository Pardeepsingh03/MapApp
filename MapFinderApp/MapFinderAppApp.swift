//
//  MapFinderAppApp.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI

@main
struct MapFinderAppApp: App {
   
    @StateObject private var locationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsViewModel)
        }
        
    }
      
}
