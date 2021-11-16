//
//  EventView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventView: View {
    
    var marvelData: MarvelViewModel
    
    var body: some View {
        WebImage(url: marvelData.imageUrl)
            .resizable()
            .overlay(
                Text(marvelData.title)
                    .font(.customText(size: 25))
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom], 10)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top)), alignment: .bottom
            )
            .cornerRadius(10)
            .frame(width: Sizes.screenWidth - 40)
    }
}


