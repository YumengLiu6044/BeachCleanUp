//
//  SettingView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Setting!")
                
                Image(systemName: "gear")
                    .font(.largeTitle)
            }
            .navigationTitle("Setting")
        }
    }
}

#Preview {
    SettingView()
}
