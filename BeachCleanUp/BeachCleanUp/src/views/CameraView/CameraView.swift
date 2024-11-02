//
//  CameraView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI
import MijickCameraView

struct CameraView: View {
    
    @Namespace var namespace
    
    @ObservedObject private var cameraVM: CameraViewModel = CameraViewModel()
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
        DefaultCameraView(cameraManager: manager, namespace: namespace, closeControllerAction: {})
        .outputTypePickerVisible(false)
    }
    
    var body: some View {
        let showCameraView = cameraVM.showCameraView
        
        VStack {
            if showCameraView, let captured = cameraVM.capturedImage {
                ImagePreview()
                    .environmentObject(cameraVM)
            }
            else {
                MCameraController(manager: manager)
                    .cameraScreen(customCamera)
                    .onImageCaptured { captured in
                        cameraVM.capturedImage = captured
                    }
            }
        }
    }
}

#Preview {
    CameraView()
}
