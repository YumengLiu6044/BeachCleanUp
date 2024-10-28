//
//  CameraView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI
import MijickCameraView

struct CameraView: View {
    @State private var image: UIImage?
    
    @ObservedObject private var manager: CameraManager = .init(
            outputType: .photo,
            cameraPosition: .back,
            resolution: .hd4K3840x2160,
            frameRate: 25,
            flashMode: .off,
            isGridVisible: false,
            focusImageColor: .yellow,
            focusImageSize: 92
        )
    
    var body: some View {
        VStack {
            if let _ = image {
                Text("Captured")
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            else {
                MCameraController(manager: manager)
                    .onImageCaptured { captured in
                        self.image = captured
                    }
            }
        }
    }
}

#Preview {
    CameraView()
}
