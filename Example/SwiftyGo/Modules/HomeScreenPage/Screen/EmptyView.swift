//
//  EmptyView.swift
//  Demo
//
//  Created by Hitarth on 01/10/21.
//

import SwiftUI
import SwiftyGo

struct EmptyView: View {
    
    var body: some View {
        VStack {
            
            MainNavBar(title: "Hello", leftButtonImage: "chevron.left", rightButtonImage: "car", isSystemImage: (left: true, right: true), leftButtonAction: {
                
                Coordinator.dismissView()
                
            }, rightButtonAction: {})
            
            Spacer()
            
            Image("Hello")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Hello There!")
                .font(.title)
                .fontWeight(.medium)
                .padding(.top, 10)
            
            Spacer()
            
        }.background(Color.backgroundColor())
        .edgesIgnoringSafeArea(.all)
        
    }
}
