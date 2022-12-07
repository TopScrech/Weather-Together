import SwiftUI
import BottomSheet

enum BottomSheetRelativePosition: CGFloat, CaseIterable {
    case middle = 0.55
    case top = 0.8
}

struct MainView: View {
    @State var bottomSheetPosition: BottomSheetRelativePosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetRelativePosition.middle.rawValue
    @State var hasDragged: Bool = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetRelativePosition.middle.rawValue) / (BottomSheetRelativePosition.top.rawValue - BottomSheetRelativePosition.middle.rawValue)
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                
                ZStack {
                    
                    WeatherView()
                        .offset(y: -bottomSheetTranslationProrated * 220)
                    
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(position.rawValue.formatted())
                    } content: {
                        ForcastView()
                            .ignoresSafeArea(.all)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight

                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetRelativePosition.top {
                                hasDragged = true
                            } else {
                                hasDragged = false
                            }
                        }
                    }
                    
                    TabBar()
                        .offset(y: bottomSheetTranslationProrated * 100)
                }
            }
        }.preferredColorScheme(.light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
