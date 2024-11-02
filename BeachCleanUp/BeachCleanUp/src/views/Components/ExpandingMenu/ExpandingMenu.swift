//
//  ExpandingMenu.swift
//  BeachCleanUp
//
//  Created by Yumeng Liu on 11/1/24.
//

import SwiftUI

struct ExpandingMenu: View {
    @EnvironmentObject var mapVM: MapViewModel
    
    @State var isExpanded: Bool = true
    
    var body: some View {
        let trashMenuOption = mapVM.trashMenuOption
        let trashCanMenuOption = mapVM.trashCanMenuOption
        let roverMenuOption = mapVM.roverMenuOption
        
        VStack(alignment: .leading) {
            Button {
                withAnimation(.spring(duration: 0.5)) {
                    isExpanded.toggle()
                }
            }
            label: {
                Image(systemName: "list.dash")
                    .font(.title2)
                    .padding(5)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2)
                            .background(.ultraThickMaterial, in: .rect(cornerRadius: 8))
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            if isExpanded {
                Group {
                    MenuOptionView(systemName: trashMenuOption.imageName, labelText: trashMenuOption.labelText.rawValue, isActive: $mapVM.trashMenuOption.isActive, color: trashMenuOption.color)
        
                    MenuOptionView(systemName: trashCanMenuOption.imageName, labelText: trashCanMenuOption.labelText.rawValue, isActive: $mapVM.trashCanMenuOption.isActive, color: trashCanMenuOption.color)
                    
                    MenuOptionView(systemName: roverMenuOption.imageName, labelText: roverMenuOption.labelText.rawValue, isActive: $mapVM.roverMenuOption.isActive, color: roverMenuOption.color)
                }
                .animation(.interactiveSpring, value: isExpanded)
            }
            Spacer()
        }
    }
}

#Preview {
    ExpandingMenu(/*isExpanded: .constant(true)*/)
        .environmentObject(MapViewModel())
}
