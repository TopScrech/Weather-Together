import Foundation

struct WindTempHum: Identifiable {
    var id = UUID()
    var name, ns: String
    var value: Int
}
