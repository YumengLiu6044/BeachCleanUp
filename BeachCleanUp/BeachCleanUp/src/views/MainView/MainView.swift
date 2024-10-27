import SwiftUI

struct MainView: View {
    @ObservedObject var appViewModel = AppViewModel()

    var body: some View {
        VStack {
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
        }
        .safeAreaInset(edge: .bottom) {
            TabBar()
                .environmentObject(appViewModel)
        }

    }
}

#Preview {
    MainView()
}
