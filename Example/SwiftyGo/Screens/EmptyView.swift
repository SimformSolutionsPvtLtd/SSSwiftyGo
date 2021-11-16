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
            
            ReusableNavBar(title: "Notifications", leftButtonImage: "chevron.left", rightButtonImage: "", isSystemImage: (left: true, right: true), leftButtonAction: {
                
                Coordinator.dismissView()
                
            }, rightButtonAction: {})
            
            Spacer()
            
            Image("Hello")
                .resizable()
                .frame(width: 300, height: 300)
            
            Text("Oops! you don't get any notification today")
                .font(.customText(size: 18))
                .fontWeight(.medium)
                .padding(.top, 10)
            
            Spacer()
            
        }.background(Color.backgroundColor())
        .edgesIgnoringSafeArea(.all)
        
    }
}
