//
//  MapViewModel.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/27/24.
//

import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    @Published var cameraPosition: MapCameraPosition
    
    @State private var locationManager = LocationManager()
    
    init() {
        cameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
    }
}
