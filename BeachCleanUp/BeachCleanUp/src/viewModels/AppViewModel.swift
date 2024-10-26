//
//  AppViewModel.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import Foundation
import SwiftUI



class AppViewModel : ObservableObject {
    @Published var tabSelection: TabSelection = .map
    
    public func switchTo(tab selection: TabSelection, after delay: Int = 0, animationLength length: CGFloat = 0.5) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
                withAnimation(.snappy(duration: TimeInterval(length))) {
                    self.tabSelection = selection
                }
            })
        }
    
}
