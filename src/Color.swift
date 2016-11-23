//
// HejkiSwiftCore
//
// Copyright (c) 2015-2016 Hejki
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#if os(iOS)
    import UIKit
    typealias Color = UIColor
#else
    import AppKit
    typealias Color = NSColor
#endif

public extension Color {
    
    /**
     Init color by passing hex and alpha value.
     
     - parameter hexString: color string representation in form #00FF00 or 00FF00
     - parameter alpha: alpha value for color, default is 1.0 (non transparent)
     */
    convenience init?(hexString: String, alpha: Float = 1.0) {
        var hex = hexString
        
        if hex.hasPrefix("#") {
            hex = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 1))
        }
        
        if (hex.range(of: "(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .regularExpression) != nil) {
            
            // Deal with 3 character Hex strings
            if hex.characters.count == 3 {
                let redHex   = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 1))
                let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 1) ..< hex.characters.index(hex.startIndex, offsetBy: 2)))
                let blueHex  = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 2))
                
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
            
            let redHex = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 2))
            let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 2) ..< hex.characters.index(hex.startIndex, offsetBy: 4)))
            let blueHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 4) ..< hex.characters.index(hex.startIndex, offsetBy: 6)))
            
            var redInt:   CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt:  CUnsignedInt = 0
            
            Scanner(string: redHex).scanHexInt32(&redInt)
            Scanner(string: greenHex).scanHexInt32(&greenInt)
            Scanner(string: blueHex).scanHexInt32(&blueInt)
            
            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        } else {
            return nil
        }
    }

    /**
     Init color with hex representation.
     
     - parameter hex: integer hex representation, example: 0x00FF00
     - parameter alpha: alpha value for color, default is 1.0
     */
    convenience init!(hex: Int, alpha: Float = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
    
    /**
     Init color with named value from specific
     */
    convenience init!(named: ColorIdentifier) {
        self.init(hex: named.hexValue)
    }
    
    /**
     Returns hex string representation of this color.
     
     - parameter withAlpha: return alpha component in string representation?
     */
    func hexString(withAlpha: Bool = false) -> String? {
        #if os(macOS)
            guard let color = self.usingColorSpaceName(NSCalibratedRGBColorSpace) else { return nil }
            let red = Int(color.redComponent * 0xFF)
            let green = Int(color.greenComponent * 0xFF)
            let blue = Int(color.blueComponent * 0xFF)
            let alpha = Int(color.alphaComponent * 0xFF)
        #elseif os(iOS)
            let red = Int(cgColor.components![0] * 0xFF)
            let green = Int(cgColor.components![1] * 0xFF)
            let blue = Int(cgColor.components![2] * 0xFF)
            let alpha = Int(cgColor.components![3] * 0xFF)
        #endif
        
        if withAlpha {
            return String(format: "#%02X%02X%02X%02X", red, green, blue, alpha)
        }
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
}

public struct ColorIdentifier {
    fileprivate let hexValue: Int
    
    init(_ hexValue: Int) {
        self.hexValue = hexValue
    }
}

/**
 Common web color names.
 
 - see: http://www.w3schools.com/colors/colors_names.asp
 */
public extension ColorIdentifier {
    static let aliceBlue = ColorIdentifier(0xF0F8FF)
    static let antiqueWhite = ColorIdentifier(0xFAEBD7)
    static let aqua = ColorIdentifier(0x00FFFF)
    static let aquamarine = ColorIdentifier(0x7FFFD4)
    static let azure = ColorIdentifier(0xF0FFFF)
    static let beige = ColorIdentifier(0xF5F5DC)
    static let bisque = ColorIdentifier(0xFFE4C4)
    static let black = ColorIdentifier(0x000000)
    static let blanchedAlmond = ColorIdentifier(0xFFEBCD)
    static let blue = ColorIdentifier(0x0000FF)
    static let blueViolet = ColorIdentifier(0x8A2BE2)
    static let brown = ColorIdentifier(0xA52A2A)
    static let burlyWood = ColorIdentifier(0xDEB887)
    static let cadetBlue = ColorIdentifier(0x5F9EA0)
    static let chartreuse = ColorIdentifier(0x7FFF00)
    static let chocolate = ColorIdentifier(0xD2691E)
    static let coral = ColorIdentifier(0xFF7F50)
    static let cornflowerBlue = ColorIdentifier(0x6495ED)
    static let cornsilk = ColorIdentifier(0xFFF8DC)
    static let crimson = ColorIdentifier(0xDC143C)
    static let cyan = ColorIdentifier(0x00FFFF)
    static let darkBlue = ColorIdentifier(0x00008B)
    static let darkCyan = ColorIdentifier(0x008B8B)
    static let darkGoldenRod = ColorIdentifier(0xB8860B)
    static let darkGray = ColorIdentifier(0xA9A9A9)
    static let darkGrey = ColorIdentifier(0xA9A9A9)
    static let darkGreen = ColorIdentifier(0x006400)
    static let darkKhaki = ColorIdentifier(0xBDB76B)
    static let darkMagenta = ColorIdentifier(0x8B008B)
    static let darkOliveGreen = ColorIdentifier(0x556B2F)
    static let darkOrange = ColorIdentifier(0xFF8C00)
    static let darkOrchid = ColorIdentifier(0x9932CC)
    static let darkRed = ColorIdentifier(0x8B0000)
    static let darkSalmon = ColorIdentifier(0xE9967A)
    static let darkSeaGreen = ColorIdentifier(0x8FBC8F)
    static let darkSlateBlue = ColorIdentifier(0x483D8B)
    static let darkSlateGray = ColorIdentifier(0x2F4F4F)
    static let darkSlateGrey = ColorIdentifier(0x2F4F4F)
    static let darkTurquoise = ColorIdentifier(0x00CED1)
    static let darkViolet = ColorIdentifier(0x9400D3)
    static let deepPink = ColorIdentifier(0xFF1493)
    static let deepSkyBlue = ColorIdentifier(0x00BFFF)
    static let dimGray = ColorIdentifier(0x696969)
    static let dimGrey = ColorIdentifier(0x696969)
    static let dodgerBlue = ColorIdentifier(0x1E90FF)
    static let fireBrick = ColorIdentifier(0xB22222)
    static let floralWhite = ColorIdentifier(0xFFFAF0)
    static let forestGreen = ColorIdentifier(0x228B22)
    static let fuchsia = ColorIdentifier(0xFF00FF)
    static let gainsboro = ColorIdentifier(0xDCDCDC)
    static let ghostWhite = ColorIdentifier(0xF8F8FF)
    static let gold = ColorIdentifier(0xFFD700)
    static let goldenRod = ColorIdentifier(0xDAA520)
    static let gray = ColorIdentifier(0x808080)
    static let grey = ColorIdentifier(0x808080)
    static let green = ColorIdentifier(0x008000)
    static let greenYellow = ColorIdentifier(0xADFF2F)
    static let honeyDew = ColorIdentifier(0xF0FFF0)
    static let hotPink = ColorIdentifier(0xFF69B4)
    static let indianRed = ColorIdentifier(0xCD5C5C)
    static let indigo = ColorIdentifier(0x4B0082)
    static let ivory = ColorIdentifier(0xFFFFF0)
    static let khaki = ColorIdentifier(0xF0E68C)
    static let lavender = ColorIdentifier(0xE6E6FA)
    static let lavenderBlush = ColorIdentifier(0xFFF0F5)
    static let lawnGreen = ColorIdentifier(0x7CFC00)
    static let lemonChiffon = ColorIdentifier(0xFFFACD)
    static let lightBlue = ColorIdentifier(0xADD8E6)
    static let lightCoral = ColorIdentifier(0xF08080)
    static let lightCyan = ColorIdentifier(0xE0FFFF)
    static let lightGoldenRodYellow = ColorIdentifier(0xFAFAD2)
    static let lightGray = ColorIdentifier(0xD3D3D3)
    static let lightGrey = ColorIdentifier(0xD3D3D3)
    static let lightGreen = ColorIdentifier(0x90EE90)
    static let lightPink = ColorIdentifier(0xFFB6C1)
    static let lightSalmon = ColorIdentifier(0xFFA07A)
    static let lightSeaGreen = ColorIdentifier(0x20B2AA)
    static let lightSkyBlue = ColorIdentifier(0x87CEFA)
    static let lightSlateGray = ColorIdentifier(0x778899)
    static let lightSlateGrey = ColorIdentifier(0x778899)
    static let lightSteelBlue = ColorIdentifier(0xB0C4DE)
    static let lightYellow = ColorIdentifier(0xFFFFE0)
    static let lime = ColorIdentifier(0x00FF00)
    static let limeGreen = ColorIdentifier(0x32CD32)
    static let linen = ColorIdentifier(0xFAF0E6)
    static let magenta = ColorIdentifier(0xFF00FF)
    static let maroon = ColorIdentifier(0x800000)
    static let mediumAquaMarine = ColorIdentifier(0x66CDAA)
    static let mediumBlue = ColorIdentifier(0x0000CD)
    static let mediumOrchid = ColorIdentifier(0xBA55D3)
    static let mediumPurple = ColorIdentifier(0x9370DB)
    static let mediumSeaGreen = ColorIdentifier(0x3CB371)
    static let mediumSlateBlue = ColorIdentifier(0x7B68EE)
    static let mediumSpringGreen = ColorIdentifier(0x00FA9A)
    static let mediumTurquoise = ColorIdentifier(0x48D1CC)
    static let mediumVioletRed = ColorIdentifier(0xC71585)
    static let midnightBlue = ColorIdentifier(0x191970)
    static let mintCream = ColorIdentifier(0xF5FFFA)
    static let mistyRose = ColorIdentifier(0xFFE4E1)
    static let moccasin = ColorIdentifier(0xFFE4B5)
    static let navajoWhite = ColorIdentifier(0xFFDEAD)
    static let navy = ColorIdentifier(0x000080)
    static let oldLace = ColorIdentifier(0xFDF5E6)
    static let olive = ColorIdentifier(0x808000)
    static let oliveDrab = ColorIdentifier(0x6B8E23)
    static let orange = ColorIdentifier(0xFFA500)
    static let orangeRed = ColorIdentifier(0xFF4500)
    static let orchid = ColorIdentifier(0xDA70D6)
    static let paleGoldenRod = ColorIdentifier(0xEEE8AA)
    static let paleGreen = ColorIdentifier(0x98FB98)
    static let paleTurquoise = ColorIdentifier(0xAFEEEE)
    static let paleVioletRed = ColorIdentifier(0xDB7093)
    static let papayaWhip = ColorIdentifier(0xFFEFD5)
    static let peachPuff = ColorIdentifier(0xFFDAB9)
    static let peru = ColorIdentifier(0xCD853F)
    static let pink = ColorIdentifier(0xFFC0CB)
    static let plum = ColorIdentifier(0xDDA0DD)
    static let powderBlue = ColorIdentifier(0xB0E0E6)
    static let purple = ColorIdentifier(0x800080)
    static let rebeccaPurple = ColorIdentifier(0x663399)
    static let red = ColorIdentifier(0xFF0000)
    static let rosyBrown = ColorIdentifier(0xBC8F8F)
    static let royalBlue = ColorIdentifier(0x4169E1)
    static let saddleBrown = ColorIdentifier(0x8B4513)
    static let salmon = ColorIdentifier(0xFA8072)
    static let sandyBrown = ColorIdentifier(0xF4A460)
    static let seaGreen = ColorIdentifier(0x2E8B57)
    static let seaShell = ColorIdentifier(0xFFF5EE)
    static let sienna = ColorIdentifier(0xA0522D)
    static let silver = ColorIdentifier(0xC0C0C0)
    static let skyBlue = ColorIdentifier(0x87CEEB)
    static let slateBlue = ColorIdentifier(0x6A5ACD)
    static let slateGray = ColorIdentifier(0x708090)
    static let slateGrey = ColorIdentifier(0x708090)
    static let snow = ColorIdentifier(0xFFFAFA)
    static let springGreen = ColorIdentifier(0x00FF7F)
    static let steelBlue = ColorIdentifier(0x4682B4)
    static let tan = ColorIdentifier(0xD2B48C)
    static let teal = ColorIdentifier(0x008080)
    static let thistle = ColorIdentifier(0xD8BFD8)
    static let tomato = ColorIdentifier(0xFF6347)
    static let turquoise = ColorIdentifier(0x40E0D0)
    static let violet = ColorIdentifier(0xEE82EE)
    static let wheat = ColorIdentifier(0xF5DEB3)
    static let white = ColorIdentifier(0xFFFFFF)
    static let whiteSmoke = ColorIdentifier(0xF5F5F5)
    static let yellow = ColorIdentifier(0xFFFF00)
    static let yellowGreen = ColorIdentifier(0x9ACD32)
}
