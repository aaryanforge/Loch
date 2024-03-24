import SwiftUI

extension Color {

    //ACCENT COLOURS

    // greens 
    static let green100 = Color(hex: "E9FAE6") // bg booster
    static let green500 = Color(hex: "77BF59") //main green col
    static let green800 = Color(hex: "3D8639") // darker grren 

    //limes
    static let lime300 = Color(hex: "C7EA63") //lighter lime col

    //blues
    static let blueButton = Color(hex: "3B81D1") // button
    static let blue800 = Color(hex: "274C77") // 

    //reds
    static let redWarning = Color(hex: "D92E2E") // warning

    // NEUTRAL COLOURS

    // lights
    static let lightYellow = Color(hex: "F5FADB") //lighter lime col

    // greys
    static let grey800 = Color(hex: "454545") 


    // darks
    static let blackGreen800 = Color(hex: "111B0E") 
    static let blackBlue800 = Color(hex: "131E2D") // for fonts

    // TINTS
    static let greenTint30 = Color(red:(119/255), green: (191/255), blue: (89/255), alpha: 0.3) 
    static let greenTint50 = Color(red:(119/255), green: (191/255), blue: (89/255), alpha: 0.5) 

     static let grayTint50 = Color(red:0, green: 0, blue: 0, alpha: 0.5) 
}

// added if we want to use hex vals in the future
// code taken from kontiki via stackoverflow

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}