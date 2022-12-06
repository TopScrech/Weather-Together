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
            VStack(alignment: .leading, spacing: 0) {

                Spacer().frame(height: 50)
                
                // MARK: - Date and Profile Pic
                HStack {
                    Text("Sun. Dec 4th, 2022").font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .textCase(.uppercase)
                    
                    Spacer()
                    
                    Image(uiImage: #imageLiteral(resourceName: "Profile Pic"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                    
                }
                
                Spacer().frame(height: 40)
                
                // MARK: - Weather
                HStack(spacing: 10) {
                    Image("Sun Cloud")
                        .resizable()
                        .frame(width: 107, height: 107)
                    
                    VStack {
                        Text("20°C")
                            .font(.system(size: 54, weight: .bold, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.12, blue: 0.25, alpha: 1)))
                        
                        Text("Magnolia, TX")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(#colorLiteral(red: 0.04, green: 0.12, blue: 0.25, alpha: 1)))
                            .textCase(.uppercase)

                        Text("Partly CloudY")
                            .font(.system(size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.26, blue: 0.95, alpha: 1)))
                            .textCase(.uppercase)
                    }
                }
                
                Spacer().frame(height: 32)

                
            }.padding(.horizontal, 25)
            
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
                        
                    }.padding(.horizontal, 24)
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
