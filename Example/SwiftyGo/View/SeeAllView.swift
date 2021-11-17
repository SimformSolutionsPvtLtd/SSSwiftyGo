//
//  SeeAllView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 08/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftyGo

struct SeeAllView<Model, Content>: View where Content: View, Model: Identifiable {
    
    var sectionItem: String
    var items: [Model]
    var content: (Model) -> Content
    
    private let gridLayout = [
        GridItem(.flexible(minimum: 100), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: 100), spacing: 0, alignment: .center)
    ]
    
    init(sectionItem: String, items: [Model]?, @ViewBuilder content: @escaping (Model) -> Content) {
        self.sectionItem = sectionItem
        self.items = items ?? []
        self.content = content
    }
    
    var body: some View {
        VStack {
            ReusableNavBar(title: "See All", leftButtonImage: "chevron.left", rightButtonImage: "", isSystemImage: (left: true, right: true), leftButtonAction: {
                Coordinator.dismissView()
            }, rightButtonAction: {})
            
            LazyVGrid(columns: gridLayout, spacing: 0, content: {
                ForEach(items) { value in
                    content(value)
                }
                // LazyHGrid
            })
            
            Spacer()
        }
    }
}
