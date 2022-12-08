import SwiftUI

struct Date: View {
    var body: some View {
        Text("Sun. Dec 4th, 2022")
            .font(.system(size: 16, weight: .heavy))
            .foregroundColor(Color(0x6F6F6F))
            .multilineTextAlignment(.center)
            .textCase(.uppercase)
    }
}

struct Date_Previews: PreviewProvider {
    static var previews: some View {
        Date()
    }
}
