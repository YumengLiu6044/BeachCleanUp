//
//  ContentView.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI



struct MainView: View {
    @ObservedObject var appViewModel = AppViewModel()
    
    
    var body: some View {
        TabView(selection: $appViewModel.tabSelection) {
            MapView()
                .animation(.easeInOut(duration: 1.0), value: appViewModel.tabSelection)
                .transition(.slide)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(TabSelection.map)
            
            CameraView()
                .animation(.easeInOut(duration: 1.0), value: appViewModel.tabSelection)
                .transition(.slide)
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
                .tag(TabSelection.camera)
            
            SettingView()
                .animation(.easeInOut(duration: 1.0), value: appViewModel.tabSelection)
                .transition(.slide)
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
                .tag(TabSelection.setting)
        }
        .tint(.green)
        .tabViewStyle(.sidebarAdaptable)
        
        
    }
}

#Preview {
    MainView()
}
