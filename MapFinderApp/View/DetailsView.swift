//
//  DetailsView.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var locations: Location
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.thinMaterial)
                .frame(height:200)
                .overlay {
                    HStack(spacing: 0){
                        Image(locations.imageNames.first!)
                            .resizable()
                            .frame(width: 130,height: 160)
                            .cornerRadius(10)
                        
                            .padding()
                        VStack(alignment: .leading){
                            Text(locations.name)
                                .font(.title)
                                .frame(maxWidth: .infinity)
                            Text(locations.cityName)
                                .frame(maxWidth: .infinity)
                                .font(.subheadline)
                            
                            
                            VStack{
                                Button {
                                    vm.nextButtonPressed()
                                } label: {
                                    Text("Go to next ")
                                        .foregroundColor(.primary)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                        
                                }
                                
                              
                                    
                                    Button {
                                        vm.showLocation = locations
                                        
                                    } label: {
                                        Text("Explore more ")
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.red)
                                            .cornerRadius(10)
                                        
                                    }
                            }
                            
                            
                          
                            
                        }
                        .padding()
                    }
                }
            
        }
        .padding()
        .padding(.bottom,20)
        .shadow(radius: 10)
        .sheet(item: $vm.showLocation) { location in
            CityInformationView(imageList: location)
        }
    }
}


struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(locations: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
           
    }
}
