//
//  LocationsViewModel.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
   
    @Published var location: [Location]
    @Published var mapLocations: Location {
        didSet{
            updateRegion(loccations: mapLocations)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var isListShow: Bool = false
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init(){
        let locations = LocationsDataService.locations
        self.location = locations
        self.mapLocations = locations.first!
        updateRegion(loccations: locations.first!)
    }
    
    func updateRegion(loccations: Location){
        mapRegion = MKCoordinateRegion(center: loccations.coordinates, span: mapSpan)
    }
    func toggleListView(){
        isListShow.toggle()
    }
    func updateLocations(locate: Location){
        withAnimation {
            mapLocations = locate
            isListShow = false
            
        }
    }
    
    func nextButtonPressed(){
        guard let currentLocation = location.firstIndex(where: { $0 == mapLocations }) else {return}
        let nextIndex = currentLocation + 1
        guard location.indices.contains(nextIndex) else {
            guard let firstIndex = location.first else { return  }
            updateLocations(locate: firstIndex)
            return
        }
        let nextLocation = location[nextIndex]
        updateLocations(locate: nextLocation)
    }
}
