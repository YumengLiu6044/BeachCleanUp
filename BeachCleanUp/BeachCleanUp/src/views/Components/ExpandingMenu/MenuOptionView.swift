//
//  MenuOption.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 11/1/24.
//

import SwiftUI

struct MenuOptionView: View {
    var systemName: String?
    var labelText: String
    var customImageName: String?
    
    @Binding var isActive: Bool
    
    var color: Color = .clear
    
    var body: some View {
        Button {
            withAnimation(.smooth) {
                isActive.toggle()
            }
        }
        label: {
            if let systemName = systemName {
                Label(labelText, systemImage: systemName)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .background(.ultraThickMaterial, in: .rect(cornerRadius: 10))
                            .frame(width: 150, height: 50)
                    }
                
            }
            else if let customImageName = customImageName {
                Label(labelText, image: customImageName)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .background(.ultraThickMaterial, in: .rect(cornerRadius: 10))
                            .frame(width: 150, height: 50)
                    }
            }
        }
        .frame(width: 150, height: 50)
        .buttonStyle(.plain)
        .foregroundStyle( isActive ? self.color : .secondary)
        
    }
}


extension MenuOptionView {
    init(systemName: String, labelText: String, isActive: Binding<Bool>, color: Color) {
        self.systemName = systemName
        self.labelText = labelText
        self._isActive = isActive
        self.color = color
    }
    
    init(customImage: String, labelText: String, isActive: Binding<Bool>, color: Color) {
        self.customImageName = customImage
        self.labelText = labelText
        self._isActive = isActive
        self.color = color
    }
    
}
#Preview {
    MenuOptionView(systemName: "trash", labelText: "Trash Can", isActive: .constant(true), color: .red)
    
}
