//
//  MenuOption.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 11/1/24.
//

import SwiftUI

struct MenuOption: View {
    var systemName: String?
    var labelText: String
    var customImageName: String?
    
    @Binding var isActive: Bool
    
    @State private var color: Color = .clear
    
    var body: some View {
        Button {
            
        }
        label: {
            if let systemName = systemName {
                Label(labelText, systemImage: systemName)
                .fontWeight(.semibold)
                .font(.title2)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .background(.ultraThickMaterial, in: .rect(cornerRadius: 10))
                }
                
            }
            else if let customImageName = customImageName {
                Label(labelText, image: customImageName)
                .fontWeight(.semibold)
                .font(.title2)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .background(.ultraThickMaterial, in: .rect(cornerRadius: 10))
                }
            }
        }
        .tint(isActive ? .none : .secondary)
    }
}


extension MenuOption {
    init(systemName: String, labelText: String, isActive: Binding<Bool>) {
        self.systemName = systemName
        self.labelText = labelText
        self._isActive = isActive
    }
    
    init(customImage: String, labelText: String, isActive: Binding<Bool>) {
        self.customImageName = customImage
        self.labelText = labelText
        self._isActive = isActive
    }
    
    func setColor(_ color: Color) -> MenuOption {
        var modified = self
        modified.color = color
        return modified
    }
    
}
#Preview {
    MenuOption(systemName: "trash", labelText: "Trash Can", isActive: .constant(true))
        .setColor(.red)
        
}
