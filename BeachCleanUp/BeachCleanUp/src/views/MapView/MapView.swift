//
//  MapView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var mapViewModel = MapViewModel()
    
    var body: some View {
        ZStack {
            Map(
                position: $mapViewModel.cameraPosition,
                bounds: mapViewModel.cameraBounds
            ) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                
            }
            .mapStyle(.standard(pointsOfInterest: .excludingAll))
            
            ExpandingMenu()
                .environmentObject(mapViewModel)
                .padding(.leading)
        }
    }
}

#Preview {
    MapView()
}
