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
                
                ZStack {
                    
                    WeatherView()
                        .offset(y: -bottomSheetTranslationProrated * 46)
                    
//                    TabView {
//                        WeatherView()
//                            .tabItem {
//                                Image(systemName: "house")
//                            }
//                            .toolbar(.visible, for: .tabBar)
//                            .toolbarBackground(.gray, for: .tabBar)
//
//                        WeatherView()
//                            .tabItem {
//                                Image(systemName: "magnifyingglass")
//                            }
//
//                        WeatherView()
//                            .tabItem {
//                                Image(systemName: "flame")
//                            }
//
//                        WeatherView()
//                            .tabItem {
//                                Image(systemName: "gearshape")
//                            }
//                    }
                    
                    BottomSheetView(position: $bottomSheetPosition) {
//                        Text(position.rawValue.formatted())
                    } content: {
                        ForcastView()
                            .frame(maxWidth: .infinity)
                    }
                    
                    TabBar()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
