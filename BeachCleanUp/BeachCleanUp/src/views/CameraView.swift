//
//  CameraView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        VStack {
            Text("Camera!")
            
            Image(systemName: "camera")
                .font(.largeTitle)
        }
    }
}

#Preview {
    CameraView()
}
