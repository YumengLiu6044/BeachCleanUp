//
//  ImagePreview.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 11/1/24.
//

import SwiftUI

struct ImagePreview: View {
    @EnvironmentObject var cameraVM: CameraViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ImagePreview()
        .environmentObject(CameraViewModel())
}
