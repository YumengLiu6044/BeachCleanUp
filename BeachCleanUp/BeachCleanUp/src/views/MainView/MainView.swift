import SwiftUI
import MijickCameraView

struct MainView: View {
    @ObservedObject var appViewModel = AppViewModel()
    @ObservedObject private var manager: CameraManager = .init(
            outputType: .photo,
            cameraPosition: .back,
            resolution: .hd4K3840x2160,
            frameRate: 25,
            flashMode: .off,
            isGridVisible: false,
            focusImageColor: .yellow,
            focusImageSize: 92
        )

    var body: some View {
        VStack {
            switch appViewModel.tabSelection {
            case .map:
                MapView()
                    .transition(.move(edge: .leading).combined(with: .opacity))

            case .camera:
                CameraView()
                    .transition(.opacity)
                    .environmentObject(manager)

            case .setting:
                InfoView()
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
