//
//  ColorExt.swift
// 
//
//  Created by Hitarth on 30/08/21.
//

import SwiftUI

extension Color {
    
    static func backgroundColor() -> Color {
        return Color("Background")
    }
    
    static func textColor() -> Color {
        return Color("Text")
    }
    
    static func reverseTextColor() -> Color {
        return Color("ReverseText")
    }
    
    static func highlightedColor() -> Color {
        return Color("Highlight")
    }
    
    static func headerColor() -> Color {
        return Color("Header")
    }
    
}
