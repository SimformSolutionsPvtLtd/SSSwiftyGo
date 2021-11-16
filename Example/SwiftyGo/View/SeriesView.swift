//
//  SeriesView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeriesView: View {
    
    var marvelData: MarvelViewModel
    
    var body: some View {
        HStack {
            
            WebImage(url: marvelData.imageUrl)
                .resizable()
                .cornerRadius(10)
                .frame(width: 120, height: 80)
            
            VStack(alignment: .leading) {
                
                Text(marvelData.title)
                    .font(.customText(size: 20))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(.black)

                Text("31/07/2000")
                    .font(.customText(size: 18))
                    .foregroundColor(.gray)
                
                // VStack
            }
            
            Spacer()
            
            // HStack
        }.frame(width: Sizes.screenWidth/1.2)
    }
}
