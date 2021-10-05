//
//  HomeView.swift
//  Demo
//
//  Created by Hitarth on 17/09/21.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftyGo

struct HomeView: View {

    @ObservedObject var delegator = HomeViewModel.shared
    
    var body: some View {
            VStack {
                
                HomeNavBar(leftButtonAction: {}, rightButtonAction: {
                    Coordinator.present(content: EmptyView())
                })
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                
                    ProjectCollectionView(onSelect: { article in
                        Coordinator.moveToView(content: ContentView(article: article))
                    })
                    .frame(height: (Sizes.screenHeight), alignment: .center)
                    .padding()
                
                    //Scroll View
                }
                
            }.background(Color.backgroundColor())
            .edgesIgnoringSafeArea(.all)
    }
}
