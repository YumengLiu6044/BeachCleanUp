//
//  MenuOptions.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 11/2/24.
//

import Foundation
import SwiftUI

enum LabelName: String {
    case trash = "Trash"
    case trashCan = "Trash Can"
    case rover = "Rover"
}

struct MenuOption {
    var labelText: LabelName
    
    var isActive: Bool = true
    
    var imageName : String {
        switch labelText {
        case .rover:
            return "globe"
        case .trash:
            return "trash"
        case .trashCan:
            return "person.fill"
        }
    }
    
    var color : Color {
        switch labelText {
        case .trash:
            return .black
        case .trashCan:
            return .green
        case .rover:
            return .purple
        }
    }
}

extension MenuOption {
    
    static func rover() -> MenuOption {
        return .init(labelText: .rover)
    }
    static func trash() -> MenuOption {
        return .init(labelText: .trash)
    }
    static func trashCan() -> MenuOption {
        return .init(labelText: .trashCan)
    }
}
