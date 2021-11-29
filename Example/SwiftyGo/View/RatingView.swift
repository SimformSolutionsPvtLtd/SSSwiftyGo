//
//  RatingView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 16/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    var ratings: Double
    var spacing: CGFloat
    var scale: Image.Scale
    
    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            ForEach(1...5, id: \.self) { rating in
               Image(systemName: "star.fill")
                    .foregroundColor(rating <= Int(ratings) ? .yellow : .gray)
                    .imageScale(scale)
            }
            // HStack
        }
    }
}
