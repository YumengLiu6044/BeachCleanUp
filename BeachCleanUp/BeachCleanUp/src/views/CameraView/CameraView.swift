//
//  CameraView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI
import MijickCameraView

struct CameraView: View {
    @EnvironmentObject var manager: CameraManager
    
    @Namespace var namespace
    
    @ObservedObject private var cameraVM: CameraViewModel = CameraViewModel()
    
    
    @ViewBuilder
    private func customCamera(manager: CameraManager, namespace: Namespace.ID, action: @escaping () -> Void) -> any MCameraView {
        DefaultCameraView(cameraManager: manager, namespace: namespace, closeControllerAction: {})
        .outputTypePickerVisible(false)
    }
    
    var body: some View {
        let showCameraView = cameraVM.showCameraView
        
        VStack {
            if showCameraView, let _ = cameraVM.capturedImage {
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
        .onDisappear {
            
        }
    }
}

//#Preview {
//    CameraView()
//}
