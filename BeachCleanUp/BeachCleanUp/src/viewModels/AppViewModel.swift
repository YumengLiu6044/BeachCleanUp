//
//  AppViewModel.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 10/25/24.
//

import Foundation
import SwiftUI

enum TabSelection: Hashable {
    case map
    case camera
    case setting
}

class AppViewModel : ObservableObject {
    @Published var tabSelection: TabSelection = .map
    
}
