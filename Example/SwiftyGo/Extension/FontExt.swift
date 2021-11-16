//
//  FontExt.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 16/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

extension Font {
    
    static func header() -> Font {
        return Font.custom("Cochin", size: 20)
    }
    
    static func customTitle() -> Font {
        return Font.custom("Cochin", size: 35)
    }
    
    static func customText(size: CGFloat) -> Font {
        return Font.custom("Gill Sans", size: size)
    }
}
