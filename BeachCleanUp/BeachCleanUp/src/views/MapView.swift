//
//  MapView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack {
            Text("Map!")
            
            Image(systemName: "map")
                .font(.largeTitle)
        }
    }
}

#Preview {
    MapView()
}
