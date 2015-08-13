//
//  Color.swift
//  SwiftExtensionsLib
//
//  Created by Hejki on 13.08.15.
//
//

#if os(iOS)
    import UIKit
    typealias SWColor = UIColor
#else
    import Cocoa
    typealias SWColor = NSColor
#endif

public extension SWColor {
    
    convenience init!(hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init!<T: RawRepresentable where T.RawValue == Int>(named: T) {
        self.init(hex: named.rawValue)
    }
}

public enum Colors: Int {
    case Aqua = 0x00FFFF
    case Black = 0x000000
    case Blue = 0x0000FF
    case Fuchsia = 0xFF00FF
    case Gray = 0x808080
    case Green = 0x008000
    case Lime = 0x00FF00
    case Maroon = 0x800000
    case Navy = 0x000080
    case Olive = 0x808000
    case Orange = 0xFFA500
    case Purple = 0x800080
    case Red = 0xFF0000
    case Silver = 0xC0C0C0
    case Teal = 0x008080
    case White = 0xFFFFFF
    case Yellow = 0xFFFF00
    case AliceBlue = 0xF0F8FF
    case AntiqueWhite = 0xFAEBD7
    case Aquamarine = 0x7FFFD4
    case Azure = 0xF0FFFF
    case Beige = 0xF5F5DC
    case Bisque = 0xFFE4C4
    case BlanchedAlmond = 0xFFEBCD
    case BlueViolet = 0x8A2BE2
    case Brown = 0xA52A2A
    case BurlyWood = 0xDEB887
    case CadetBlue = 0x5F9EA0
    case Chartreuse = 0x7FFF00
    case Chocolate = 0xD2691E
    case Coral = 0xFF7F50
    case CornflowerBlue = 0x6495ED
    case Cornsilk = 0xFFF8DC
    case Crimson = 0xDC143C
    case DarkBlue = 0x00008B
    case DarkCyan = 0x008B8B
    case DarkGoldenRod = 0xB8860B
    case DarkGray = 0xA9A9A9
    case DarkGreen = 0x006400
    case DarkKhaki = 0xBDB76B
    case DarkMagenta = 0x8B008B
    case DarkOliveGreen = 0x556B2F
    case DarkOrange = 0xFF8C00
    case DarkOrchid = 0x9932CC
    case DarkRed = 0x8B0000
    case DarkSalmon = 0xE9967A
    case DarkSeaGreen = 0x8FBC8F
    case DarkSlateBlue = 0x483D8B
    case DarkSlateGray = 0x2F4F4F
    case DarkTurquoise = 0x00CED1
    case DarkViolet = 0x9400D3
    case DeepPink = 0xFF1493
    case DeepSkyBlue = 0x00BFFF
    case DimGray = 0x696969
    case DodgerBlue = 0x1E90FF
    case FireBrick = 0xB22222
    case FloralWhite = 0xFFFAF0
    case ForestGreen = 0x228B22
    case Gainsboro = 0xDCDCDC
    case GhostWhite = 0xF8F8FF
    case Gold = 0xFFD700
    case GoldenRod = 0xDAA520
    case GreenYellow = 0xADFF2F
    case HoneyDew = 0xF0FFF0
    case HotPink = 0xFF69B4
    case IndianRed = 0xCD5C5C
    case Indigo = 0x4B0082
    case Ivory = 0xFFFFF0
    case Khaki = 0xF0E68C
    case Lavender = 0xE6E6FA
    case LavenderBlush = 0xFFF0F5
    case LawnGreen = 0x7CFC00
    case LemonChiffon = 0xFFFACD
    case LightBlue = 0xADD8E6
    case LightCoral = 0xF08080
    case LightCyan = 0xE0FFFF
    case LightGoldenRodYellow = 0xFAFAD2
    case LightGrey = 0xD3D3D3
    case LightGreen = 0x90EE90
    case LightPink = 0xFFB6C1
    case LightSalmon = 0xFFA07A
    case LightSeaGreen = 0x20B2AA
    case LightSkyBlue = 0x87CEFA
    case LightSlateGray = 0x778899
    case LightSteelBlue = 0xB0C4DE
    case LightYellow = 0xFFFFE0
    case LimeGreen = 0x32CD32
    case Linen = 0xFAF0E6
    case MediumAquaMarine = 0x66CDAA
    case MediumBlue = 0x0000CD
    case MediumOrchid = 0xBA55D3
    case MediumPurple = 0x9370DB
    case MediumSeaGreen = 0x3CB371
    case MediumSlateBlue = 0x7B68EE
    case MediumSpringGreen = 0x00FA9A
    case MediumTurquoise = 0x48D1CC
    case MediumVioletRed = 0xC71585
    case MidnightBlue = 0x191970
    case MintCream = 0xF5FFFA
    case MistyRose = 0xFFE4E1
    case Moccasin = 0xFFE4B5
    case NavajoWhite = 0xFFDEAD
    case OldLace = 0xFDF5E6
    case OliveDrab = 0x6B8E23
    case OrangeRed = 0xFF4500
    case Orchid = 0xDA70D6
    case PaleGoldenRod = 0xEEE8AA
    case PaleGreen = 0x98FB98
    case PaleTurquoise = 0xAFEEEE
    case PaleVioletRed = 0xDB7093
    case PapayaWhip = 0xFFEFD5
    case PeachPuff = 0xFFDAB9
    case Peru = 0xCD853F
    case Pink = 0xFFC0CB
    case Plum = 0xDDA0DD
    case PowderBlue = 0xB0E0E6
    case RebeccaPurple = 0x663399
    case RosyBrown = 0xBC8F8F
    case RoyalBlue = 0x4169E1
    case SaddleBrown = 0x8B4513
    case Salmon = 0xFA8072
    case SandyBrown = 0xF4A460
    case SeaGreen = 0x2E8B57
    case SeaShell = 0xFFF5EE
    case Sienna = 0xA0522D
    case SkyBlue = 0x87CEEB
    case SlateBlue = 0x6A5ACD
    case SlateGray = 0x708090
    case Snow = 0xFFFAFA
    case SpringGreen = 0x00FF7F
    case SteelBlue = 0x4682B4
    case Tan = 0xD2B48C
    case Thistle = 0xD8BFD8
    case Tomato = 0xFF6347
    case Turquoise = 0x40E0D0
    case Violet = 0xEE82EE
    case Wheat = 0xF5DEB3
    case WhiteSmoke = 0xF5F5F5
    case YellowGreen = 0x9ACD32
}