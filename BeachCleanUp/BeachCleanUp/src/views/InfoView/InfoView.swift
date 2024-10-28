//
//  SettingView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Infos")
                
                Image(systemName: "info.circle")
                    .font(.largeTitle)
            }
            .navigationTitle("Info")
        }
    }
}

#Preview {
    InfoView()
}
