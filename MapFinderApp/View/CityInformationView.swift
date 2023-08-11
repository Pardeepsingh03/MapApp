//
//  CityInformationView.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI
import MapKit

struct CityInformationView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let imageList: Location
    var body: some View {
        ScrollView {
            VStack {
                TabView{
                    ForEach(imageList.imageNames, id: \.self) { items in
                        Image(items)
                            .frame(maxWidth: UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
                .shadow(radius: 10)
                VStack {
                    Text(imageList.name)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .bold()
                        
                    Text(imageList.cityName)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(.secondary)

                    Text(imageList.description)
                        .padding(.vertical,10)
                        .foregroundColor(.secondary)
                    if let url = URL(string: imageList.link){
                        Link("Go to wikipedia", destination: url)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .bold()
                            .foregroundColor(.blue)
                        Map(coordinateRegion: .constant(MKCoordinateRegion(center: imageList.coordinates, span: vm.mapSpan)), annotationItems: [imageList]) { locations in
                            MapAnnotation(coordinate: locations.coordinates) {
                                PinMarkView()
                                    .shadow(radius: 10)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .allowsHitTesting(false)
                        .cornerRadius(10)
                    }
                }
                 .padding()
                 
                 
            }
            .overlay(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "xmark")
                    }
                    .padding()
                    .onTapGesture {
                        vm.showLocation = nil
                }
            }
           
        }
        .ignoresSafeArea()
    }
}

struct CityInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CityInformationView(imageList: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
          
    }
}
