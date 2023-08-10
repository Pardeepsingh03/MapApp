//
//  PlacesView.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI

struct PlacesView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.location) { locations in
                let imageSet = locations.imageNames.first!
                Button {
                    vm.updateLocations(locate: locations)
                } label: {
                    
                    HStack {
                        Image(imageSet)
                            .resizable()
                            .frame(width: 50,height: 50)
                            .cornerRadius(10)
                        VStack(alignment: .leading) {
                            Text(locations.name)
                                .font(.headline)
                            Text(locations.cityName)
                                .font(.subheadline)
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        
                    }
                }

               
                
            }.padding(.vertical,4)
            .listRowBackground(Color.clear)
            
        }
        .listStyle(PlainListStyle())
        
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(LocationsViewModel())
    }
}
