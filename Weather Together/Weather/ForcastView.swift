import SwiftUI

struct ForcastView: View {
    var body: some View {
        ScrollView {
            Spacer().frame(height: 25)
            VStack(spacing: 0) {
                
                Text("ForcastView")
            }
        }
//        .background(Color(0xE2E9FC))
        .clipShape(RoundedRectangle(cornerRadius: 44))
        
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }

        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ForcastView()
    }
}
