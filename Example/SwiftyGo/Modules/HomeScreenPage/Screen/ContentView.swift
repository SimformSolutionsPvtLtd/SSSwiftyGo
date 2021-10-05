//
//  ContentView.swift
//  Demo
//
//  Created by Hitarth on 17/09/21.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftyGo

struct ContentView: View {
    
    var article: Article
    @ObservedObject var delegator = HomeViewModel.shared
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                
                WebImage(url: URL(string: article.urlToImage ?? ""))
                    .interpolation(.none)
                    .resizable()
                    .frame(height: Sizes.screenHeight/3, alignment: .center)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                    .onTapGesture {
                        Coordinator.present(content: EmptyView())
                    }
                
                Button(action: {
                    withAnimation(.easeInOut){
                        Coordinator.popToPrevious()
                    }
                }){
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .padding(10)
                        .background(Circle().foregroundColor(.black))
                        .padding([.leading, .top])
                    //Button
                }
                //ZStack
            }
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(article.title ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    if !(article.author?.isEmpty ?? true) {
                        
                        Text(article.author ?? "")
                            .font(.headline)
                            .padding(.bottom)
                        
                    }
                    
                    Section(header: SectionHeader(title: "Description")) {
                        
                        Text(article.articleDescription ?? "")
                            .font(.headline)
                            .fontWeight(.light)
                            .lineLimit(5)
                            .padding(.leading, 5)
                        
                    }
                   
                    //VStack
                }.padding(.horizontal)
                .frame(width: Sizes.screenWidth, alignment: .leading)
                //Scroll View
            }
            //VStack
        }
        .foregroundColor(.textColor())
        .background(Color.backgroundColor())
    }
}


struct SectionHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.textColor())
            .padding(.top)
    }
}

