//
//  ReuserNavBar.swift
//  Demo
//
//  Created by Hitarth on 01/10/21.
//

import SwiftUI

struct MainNavBar: View {
    
    var title: String
    var leftButtonImage: String
    var rightButtonImage: String
    var isSystemImage: (left: Bool, right: Bool)
    var leftButtonAction = {}
    var rightButtonAction  = {}
    
    var body: some View {
        
        
        ZStack(alignment: .bottom){
            
            HStack(alignment: .center){
                Button(action: leftButtonAction ){
                    
                    if isSystemImage.left  {
                        Image(systemName: leftButtonImage)
                    }else {
                        Image(leftButtonImage)
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                }
                
                Spacer()
                
                Text(title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                
                Button(action: rightButtonAction ){
                    if !rightButtonImage.isEmpty {
                        if isSystemImage.right  {
                            Image(systemName: rightButtonImage)
                                .imageScale(.large)
                        }else {
                            Image(rightButtonImage)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                    }
                }
                
                //HStack
            }.padding(.top, 40)
            .padding([.leading, .trailing], 20)
            .frame(height: Sizes.screenHeight/9, alignment: .center)
            .foregroundColor(.textColor())
            .background(Color.backgroundColor())
            
            //ZStack
        }
        
        
    }
}
