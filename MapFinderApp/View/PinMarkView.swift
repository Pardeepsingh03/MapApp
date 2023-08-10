//
//  PinMarkView.swift
//  MapFinderApp
//
//  Created by MBA-0019 on 10/08/23.
//

import SwiftUI

struct PinMarkView: View {
    var body: some View {
        VStack{
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding(6)
                .background(Color.red)
                .clipShape(Circle())
                
                Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-10)
        }
        
        .padding(.bottom,40)
       
       
    }
}

struct PinMarkView_Previews: PreviewProvider {
    static var previews: some View {
        PinMarkView()
    }
}
