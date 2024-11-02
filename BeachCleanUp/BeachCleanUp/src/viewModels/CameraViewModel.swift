//
//  CameraViewModel.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/27/24.
//

import SwiftUI


final class CameraViewModel: ObservableObject {
    @Published var capturedImage: UIImage?
    @Published var showCameraView: Bool = true
    
}
