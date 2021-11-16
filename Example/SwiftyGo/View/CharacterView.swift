//
//  CharacterView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterView: View {
    
    var marvelData: MarvelViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            WebImage(url: marvelData.imageUrl)
                .resizable()
                .cornerRadius(5)
                .frame(width: 100, height: 100)
            
            Text(marvelData.title)
                .font(.customText(size: 15))
                .foregroundColor(.black)
                .lineLimit(1)
                .padding(.horizontal, 5)
                .frame(width: 100)
            
            //VStack
        }
    }
}
