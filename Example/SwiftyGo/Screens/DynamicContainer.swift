//
//  DynamicContainer.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct DynamicContainer<Model, Content>: View where Content: View, Model: Identifiable {
    
    enum ContainerType {
        case stack, grid
    }
    
    var type: ContainerType
    var data: [Model]
    var content: (Model) -> Content
    
    private let gridLayout = [
        GridItem(.flexible(minimum: 100), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: 100), spacing: 0, alignment: .center)
    ]
    
    init(data: [Model]?, type: ContainerType = .stack, @ViewBuilder content: @escaping (Model) -> Content) {
        self.data = data ?? []
        self.type = type
        self.content = content
    }

    var body: some View {
        switch type {
        case .stack:
            AnyView(
                LazyHStack(spacing: 20) {
                    ForEach(data) { value in
                        self.content(value)
                    }
                    // LazyHStack
                }.padding(.horizontal)
                // AnyView
            )
        case .grid:
            AnyView(
                LazyHGrid(rows: gridLayout, spacing: 0, content: {
                    ForEach(data) { value in
                        self.content(value)
                    }
                    // LazyHGrid
                })
                // AnyView
            ).padding(.horizontal)
            // Switch
        }
        
    }
}
