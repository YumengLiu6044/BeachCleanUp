import SwiftUI

struct MainView: View {
    @ObservedObject var appViewModel = AppViewModel()
    
    var body: some View {
        ZStack {
            switch appViewModel.tabSelection {
            case .map:
                MapView()
                    .transition(.move(edge: .leading).combined(with: .opacity))
                    
            case .camera:
                CameraView()
                    .transition(.opacity)
                    
            case .setting:
                SettingView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                    
            }
            
            VStack {
                Spacer()
                TabBar()
                    .environmentObject(appViewModel)
            }
        }
    }
}



#Preview {
    MainView()
}
