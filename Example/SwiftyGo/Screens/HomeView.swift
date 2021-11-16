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
    
    @ObservedObject var homeModel = HomeViewModel.shared
    
    var body: some View {
        VStack {
            
            HomeNavBar(leftButtonAction: {
                
                Coordinator.present(content: EmptyView(), style: .formSheet)
                
            }, rightButtonAction: {})
            
            contextView()
            
        }.background(Color.backgroundColor())
    }
    
    func contextView() -> some View {
        ScrollView {
            VStack(spacing: 30) {
                
                SectionView(sectionItem: .Event, allItems: homeModel.marvelData)
                
                SectionView(sectionItem: .Characters, allItems: homeModel.marvelData)
                
                SectionView(sectionItem: .Series, allItems: homeModel.marvelData)
                
                SectionView(sectionItem: .Comics, allItems: homeModel.marvelData)
                
                // VStack
            }
            // Scroll View
        }
    }
    
}

struct sma_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
