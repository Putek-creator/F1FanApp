//
//  TeamsColor.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 09/01/2023.
//

import SwiftUI

enum TeamColor {
    case red_bull
    case alfa
    case alphatauri
    case alpine
    case aston_martin
    case ferrari
    case haas
    case mclaren
    case mercedes
    case williams
    
}

extension Constructor {
    
    var color: Color {
        switch constructorId {
        case "red_bull":
            return Color(red: 30/255, green: 91/255, blue: 198/255)
        case "alfa":
            return Color(red: 172/255, green: 32/255, blue: 57/255)
        case "alphatauri":
            return Color(red: 78/255, green: 124/255, blue: 155/255)
        case "alpine":
            return Color(red: 34/255, green: 147/255, blue: 209/255)
        case "aston_martin":
            return Color(red: 45/255, green: 130/255, blue: 109/255)
        case "ferrari":
            return Color(red: 237/255, green: 28/255, blue: 36/255)
        case "haas":
            return Color(red: 182/255, green: 186/255, blue: 189/255)
        case "mclaren":
            return Color(red: 245/255, green: 128/255, blue: 32/255)
        case "mercedes":
            return Color(red: 108/255, green: 211/255, blue: 191/255)
        case "williams":
            return Color(red: 55/255, green: 190/255, blue: 221/255)
        default:
            fatalError("Team \(self.constructorId) doesn't have color")
        }
    }
}
    
