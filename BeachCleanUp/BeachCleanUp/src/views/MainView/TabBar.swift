//
//  TabBar.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import SwiftUI

enum TabSelection: Hashable {
    case map
    case camera
    case setting
    
}

struct TabBar: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        HStack {
            Button {
                appViewModel.switchTo(tab: .map)
            }
            label: {
                VStack {
                    Image(systemName: "map.fill")
                        .font(.title)
                    
                    Text("Map")
                        .font(.caption)
                        
                }
            }
            .padding([.leading, .trailing])
            .tint(appViewModel.tabSelection == .map ? .green : .secondary)
            
            Spacer()
            
            Button {
                appViewModel.switchTo(tab: .camera)
            }
            label: {
                VStack {
                    Image(systemName: "camera.fill")
                        .font(.title)
                    
                    Text("Camera")
                        .font(.caption)
                        
                }
            }
            .padding([.leading, .trailing])
            .tint(appViewModel.tabSelection == .camera ? .green : .secondary)
            
            Spacer()
            
            Button {
                appViewModel.switchTo(tab: .setting)
            }
            label: {
                VStack {
                    Image(systemName: "gear")
                        .font(.title)
                    
                    Text("Setting")
                        .font(.caption)
                        
                }
            }
            .padding([.leading, .trailing])
            .tint(appViewModel.tabSelection == .setting ? .green : .secondary)
            
        }
        .padding([.leading, .trailing, .top])
        .background(ignoresSafeAreaEdges: .all)
        .backgroundStyle(.ultraThickMaterial)
        
    }
}

#Preview {
    TabBar()
        .environmentObject(AppViewModel())
}
