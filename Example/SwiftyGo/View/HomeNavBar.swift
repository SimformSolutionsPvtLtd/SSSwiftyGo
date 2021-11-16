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
            
        HStack(alignment: .center, spacing: 30){
               
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hey There!")
                        .font(.header())
                        .foregroundColor(.gray)
                    
                    Text("Hitarth Bhatt")
                        .fontWeight(.semibold)
                        .font(.customTitle())
                        .lineLimit(0)
                    
                    //VStack
                }
                
                Spacer()
                
                Button(action: leftButtonAction, label: {
                    Image(systemName: "bell.badge")
                        .imageScale(.large)
                        .foregroundColor(.headerColor())
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.highlightedColor().opacity(0.2))
                        )
                    
                })
                
                Button(action: rightButtonAction, label: {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundColor(.headerColor())
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.highlightedColor().opacity(0.2))
                        )
                    
                }).padding(.trailing)
                
                //HStack
            }
            .padding([.horizontal, .vertical], 20)
            .background(Color.backgroundColor())
    }
}
