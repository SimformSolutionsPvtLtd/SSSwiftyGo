//
//  DetailView.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 16/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftyGo

struct DetailView: View {
    
    var marvelData: MarvelViewModel
    var sectionItem: HomeSection
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                
                WebImage(url: marvelData.imageUrl)
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: Sizes.screenWidth, height: Sizes.screenHeight/2.5)
                    .cornerRadius(20)
                
                
                VStack(alignment: .leading) {
                 
                    HStack(alignment: .center) {
                        Text(marvelData.title)
                        .font(.customText(size: 30))
                        .fontWeight(.semibold)
                        .foregroundColor(.textColor())
                        
                        Spacer()
                        
                        Text("\(marvelData.rank ?? "") Rank")
                        .font(.customText(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.textColor())
                        
                    }.padding([.horizontal, .top])
                    
                    LinksView()
                        .padding([.horizontal, .top])
                    
                    Text(marvelData.description)
                        .font(.customText(size: 20))
                        .foregroundColor(.textColor())
                        .padding([.horizontal, .top])
                    
                    //VStack
                }
                
                RatingView(ratings: marvelData.rating, spacing: 15, scale: .large)
                    .padding([.horizontal, .top])
                
                Spacer()
                
                
                //VStack
            }
            
            NavBar()
            
            //ZStack
        }.ignoresSafeArea()
    }
    
    
    
    fileprivate func NavBar() -> some View {
        
        ZStack {
            HStack(alignment: .center) {
                Button(action: {
                    Coordinator.popToPrevious()
                }, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black.opacity(0.4))
                        )
                })
                
                Spacer()
                
                Text("\(sectionItem.rawValue) Detail")
                    .font(.header())
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                //HStack
            }.padding(.horizontal, 20)
            
            //ZStack
        }.frame(width: Sizes.screenWidth, height: Sizes.screenHeight/12, alignment: .bottom)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.6), Color.clear]), startPoint: .top, endPoint: .bottom), alignment: .bottom)
        
    }

    
    fileprivate func LinksView() -> some View {
        
        HStack(alignment: .center, spacing: 15) {
            
            ForEach(marvelData.urlType ?? [], id: \.self) { type in

                Button(action: {
                }, label: {
                    ZStack(alignment: .center) {
                     
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 40)
                            .foregroundColor(.highlightedColor().opacity(0.2))
                        
                        Text(type)
                            .font(.customText(size: 18))
                            .foregroundColor(.headerColor())
                    }
                })
                
            }
            //HStack
        }
    }
    
    
    
}

