//
//  MapViewModel.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/27/24.
//

import SwiftUI
import MapKit
import Combine

extension CLLocationCoordinate2D {
    static let newYork: Self = .init(
        latitude: 40.730610,
        longitude: -73.935242
    )
}

class MapViewModel: ObservableObject {
    @Published var cameraPosition: MapCameraPosition
    @Published var cameraBounds: MapCameraBounds
    
    @State private var userLocation: CLLocation?
    @State private var userHeading: CLHeading?
    
    @State private var locationManager = LocationManager()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        cameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
        cameraBounds = .init(minimumDistance: 100)
        
        self.locationManager.$userLocation.sink { [weak self] in
            self?.userLocation = $0
        }
        .store(in: &cancellables)
        
        self.locationManager.$userHeading.sink { [weak self] in
            self?.userHeading = $0
        }
        .store(in: &cancellables)
    }
    
}
