//
//  LocationsView.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @State private var showDetails: Bool = false
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var showList: Bool = false
    var body: some View {
        ZStack {
           // Map(coordinateRegion: $vm.mapRegion)
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.location, annotationContent: { locations in
                MapAnnotation(coordinate: locations.coordinates) {
                   PinMarkView()
                        .shadow(radius: 10)
                        .scaleEffect(vm.mapLocations == locations ? 1 : 0.7)
                        .onTapGesture {
                            vm.updateLocations(locate: locations)
                        }
                }
            })
                .ignoresSafeArea()
            VStack {
               

                VStack {
                    HStack(spacing: 0.0) {
                        Image(systemName: "arrow.down")
                            .rotationEffect(Angle(degrees: vm.isListShow ? 180 : 0))
                            .padding()
                        Text(vm.mapLocations.name + ", " + vm.mapLocations.cityName)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                            .bold()
                    }.onTapGesture {
                        withAnimation {
                            vm.toggleListView()
                        }
                    }
                    if vm.isListShow{
                        PlacesView()
                           
                    }
                }
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 10)
                Spacer()
                ZStack{
                    ForEach(vm.location) { locations in
                        if vm.mapLocations == locations{
                            DetailsView(locations: locations)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
        
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

