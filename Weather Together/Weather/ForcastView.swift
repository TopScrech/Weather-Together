import SwiftUI

struct ForcastView: View {
    var selection: [String] = ["Today", "Tomorrow", "Next Week"]
    @State var selected: String = "Today"

    var body: some View {
        ScrollView {
            
            VStack(spacing: 0) {
                
                Spacer().frame(height: 32)
                
                Picker("Forcast", selection: $selected) {
                    ForEach(selection, id: \.self) { time in
                        Text(time)
                    }
                }.pickerStyle(.segmented)
//                    .foregroundColor(Color(0x0A1F3F))
//                    .colorMultiply(.white)
                
                Spacer().frame(height: 16)
                
                Text("PARTLY CLOUDY CONDITIONS EXPECTED AROUND 4PM")
                    .font(.system(size: 12))
                    .foregroundColor(Color(0x0A1F3F))
                    .textCase(.lowercase)
                
                Spacer().frame(height: 16)
                
                ScrollView(.horizontal) {
                    VStack {
                        Spacer().frame(height: 16)
                        
                        Image("Sun Cloud")
                            .resizable()
                            .frame(width: 72, height: 72)
                        
                        Spacer().frame(height: 8)
                        
                        Text("20°C")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(0x0A1F3F))
                        
                        Spacer().frame(height: 8)
                        
                        Text("12:00")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .foregroundColor(.white)
                            .background(Color(0x1E5DFF))
                            .cornerRadius(4)
                            .padding(.horizontal, 14.5)
                        
                        Spacer().frame(height: 16)
                    }.background(.white)
                        .cornerRadius(8)
                }

            }
            .padding(.horizontal, 24)
        }
        .background(Color(0xE2E9FC))
        .clipShape(RoundedRectangle(cornerRadius: 44))
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
