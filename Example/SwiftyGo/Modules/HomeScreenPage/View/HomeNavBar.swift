//
//  CustomNavBar.swift
//  TFOur Plus
//
//  Created by Hitarth on 02/06/21.
//

import SwiftUI


struct HomeNavBar: View {
    
    var leftButtonAction = {}
    var rightButtonAction = {}
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            HStack(alignment: .center){
                Button(action: leftButtonAction){
                    
                    Image("menu")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .center)
                }
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Sizes.screenWidth/2, height: 30, alignment: .center)
                
                Spacer()
                
                
                Button(action: rightButtonAction, label: {
                    Image("EnglishLogo")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                
                //HStack
            }
            .padding([.leading, .trailing], 20)
            .padding(.bottom)
        
            //ZStack
        }.frame(height: Sizes.screenHeight/10, alignment: .bottom)
        .background(Color.black)
    }
}
