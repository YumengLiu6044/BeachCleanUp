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
    
    @Namespace var namespace
    
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
    
    @ViewBuilder
    private func customCamera(manager: CameraManager, namespace: Namespace.ID, action: @escaping () -> Void) -> any MCameraView {
        DefaultCameraView(cameraManager: manager, namespace: namespace) {
            
        }
        .outputTypePickerVisible(false)
        
        
    }
    var body: some View {
        VStack {
            if let _ = image {
                Text("Captured")
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            else {
                MCameraController(manager: manager)
                    .cameraScreen(customCamera)
                    .onImageCaptured { captured in
                        self.image = captured
                    }
                    .onVideoCaptured { capturedURL in
                        print(capturedURL.absoluteString)
                    }
            }
        }
    }
}

#Preview {
    CameraView()
}
