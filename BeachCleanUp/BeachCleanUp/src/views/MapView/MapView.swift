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
        Map(position: $mapViewModel.cameraPosition) {
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            
        }
    }
}

#Preview {
    MapView()
}
