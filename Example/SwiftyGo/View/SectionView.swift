//
//  SectionView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftyGo

struct SectionView: View {
    
    var sectionItem: HomeSection = .Event
    var allItems: [HomeSection: [MarvelViewModel]]
    var data = [Int]()
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(sectionItem.rawValue)
                    .font(.header())
                    .bold()
                
                Spacer()
                
                Button(action: {
                    Coordinator.present(content: SeeAllView(sectionItem: sectionItem.rawValue, items: allItems[sectionItem], content: { value in
                        CharacterView(marvelData: value)
                    }))
                    
                }) {
                    HStack(spacing: 10) {
                        Text("See all")
                            .font(.header())
                            .foregroundColor(.headerColor())
                        
                        Image(systemName: "chevron.right.circle.fill")
                            .imageScale(.medium)
                            .foregroundColor(.headerColor())
                            .opacity(0.5)
                    }
                }
                // HStack
            }.padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                switch sectionItem {
                case .Event:
                    DynamicContainer(data: allItems[sectionItem]) { value in
                        EventView(marvelData: value)
                            .onTapGesture {
                                Coordinator.moveToView(content: DetailView(marvelData: value, sectionItem: sectionItem))
                            }
                    }.frame(height: 220)
                    
                case .Characters:
                    DynamicContainer(data: allItems[sectionItem]) { value in
                        CharacterView(marvelData: value)
                            .onTapGesture {
                                Coordinator.moveToView(content: DetailView(marvelData: value, sectionItem: sectionItem))
                            }
                    }
                    
                case .Series:
                    DynamicContainer(data: allItems[sectionItem], type: .grid) { value in
                        SeriesView(marvelData: value)
                            .onTapGesture {
                                Coordinator.moveToView(content: DetailView(marvelData: value, sectionItem: sectionItem))
                            }
                    }
                    
                case .Comics:
                    DynamicContainer(data: allItems[sectionItem]) { value in
                        ComicView(marvelData: value)
                            .onTapGesture {
                                Coordinator.moveToView(content: DetailView(marvelData: value, sectionItem: sectionItem))
                            }
                    }
                }
                // Scroll View
            }
            // VStack
        }
    }
}
