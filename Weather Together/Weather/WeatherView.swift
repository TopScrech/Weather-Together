import SwiftUI
import BottomSheet


struct WeatherView: View {
    @State var windTempHum: [WindTempHum] = [
        .init(name: "Wind", ns: "km/h", value: 8),
        .init(name: "Temp", ns: "°C", value: 20),
        .init(name: "Humidity", ns: "°C", value: 19)
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {

                Spacer().frame(height: 56)
                
                HStack {
                    Date()
                    Spacer()
                    ProfilePic()
                }
                
                Spacer().frame(height: 40)
                
                // MARK: - Weather
                HStack(spacing: 8) {
                    Image("Sun Cloud")
                        .resizable()
                        .frame(width: 110, height: 107)
                    
                    VStack(alignment: .leading) {
                        Text("20°C")
                            .font(.system(size: 54, weight: .bold, design: .rounded))
                            .foregroundColor(Color(0x0A1F3F))
                        
                        Text("Magnolia, TX")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(0x0A1F3F))
                            .textCase(.uppercase)

                        Text("Partly CloudY")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color(0x0043F1))
                            .textCase(.uppercase)
                    }
                }
                
                Spacer().frame(height: 40)
                
            }.padding(.horizontal, 24)
            
            // MARK: - Wind Temp Humidity
            HStack(spacing: 11) {
                ForEach(windTempHum) { element in
                    VStack {
                        Text(element.name)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(0x0A1F3F))
                        
                        Text(String(element.value) + element.ns)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(0x6F6F6F))
                        
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .background(Color(0xE2E9FC))
                    .cornerRadius(8)
                }
            }

            Spacer()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
