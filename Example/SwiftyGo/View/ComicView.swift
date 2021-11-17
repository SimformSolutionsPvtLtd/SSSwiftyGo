//
//  ComicView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 07/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicView: View {
    
    var marvelData: MarvelViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: marvelData.imageUrl)
                .resizable()
                .cornerRadius(10)
                .clipped()
                .padding(.top, 5)
            
            Text(marvelData.title)
                .font(.customText(size: 20))
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .padding(.all, 10)
            // VStack
        }.frame(width: Sizes.screenWidth/2, height: Sizes.screenHeight/5)
    }
}
