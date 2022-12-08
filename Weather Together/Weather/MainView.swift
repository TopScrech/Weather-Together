import SwiftUI
import BottomSheet

enum BottomSheetRelativePosition: CGFloat, CaseIterable {
    case middle = 0.60
    case top = 0.86
}

struct MainView: View {
    @State var bottomSheetPosition: BottomSheetRelativePosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetRelativePosition.middle.rawValue
    @State var hasDragged: Bool = false
    
    @AppStorage("current_tab") var currentTab: Tab = .home
    @Namespace private var animation

    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetRelativePosition.middle.rawValue) / (BottomSheetRelativePosition.top.rawValue - BottomSheetRelativePosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                
                ZStack {
                    
                    WeatherView()
                    //                        .offset(y: -bottomSheetTranslationProrated * 220)
                    
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
                    
                    VStack {
                        Spacer()
                        NewTabBar()
                            .offset(y: bottomSheetTranslationProrated * 100)
                    }
                }
            }
        }.preferredColorScheme(.light)
    }
    
    
    @ViewBuilder
    func NewTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                //.foregroundColor(.white.opacity(0.8))
                    .foregroundColor(currentTab == tab ? .black : .white.opacity(0.8))
                //.foregroundColor(currentTab == tab ? .white : .gray.opacity(0.5))
                    .offset(y: currentTab == tab ? -10 : 0)
                    .background(content: {
                        if currentTab == tab {
                            Circle()
                                .fill(.white.opacity(0.8))
                                .scaleEffect(2.5)
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 5, y: 10)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                .offset(y: currentTab == tab ? -10 : 0)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .contentShape(Rectangle())
                    .onTapGesture { currentTab = tab }
            }
        }
        .padding(.horizontal, 15)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.65), value: currentTab)
        .background {
            CustomCorner(corners: [.topLeft, .topRight], radius: 25)
                .fill(.white)
                .ignoresSafeArea()
        }
    }
}

enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case favorite = "favorite"
    case settings = "Settings"
}

extension View {
    @ViewBuilder
    func setTabBarBackground(color: Color) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background { color.ignoresSafeArea() }
    }
}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 14 Pro Max")
        MainView()
            .previewDevice("iPhone SE3")
    }
}
