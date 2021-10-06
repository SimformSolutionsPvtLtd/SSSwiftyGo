//
//  ProjectCollectionView.swift
//  TFOur Plus
//
//  Created by Hitarth on 02/06/21.
//

import UIKit
import SwiftUI
import SDWebImage

struct ProjectCollectionView: UIViewRepresentable {
    
    var onSelect: ((Article) -> Void) = {_ in}
    @ObservedObject var homeModel = HomeViewModel.shared
    
    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.resueId)
        
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        
        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.isScrollEnabled = false
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        homeModel.getData()
        
        return collectionView
    }
    

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        var parent: ProjectCollectionView
        
        init(_ parent: ProjectCollectionView) {
            self.parent = parent
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.homeModel.newsData?.articles?.count ?? 0
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let data = parent.homeModel.newsData?.articles?[indexPath.row] else { return UICollectionViewCell() }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.resueId, for: indexPath) as! CategoryCollectionCell
            cell.layer.cornerRadius = 10
            cell.carouselImage.sd_setImage(with: URL(string: data.urlToImage ?? ""), completed: nil)
            cell.title.text = data.title ?? ""
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let data = parent.homeModel.newsData?.articles?[indexPath.row] else { return }
            parent.onSelect(data)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: Sizes.screenWidth/2.2, height: Sizes.screenHeight/5)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            cell.alpha = 0
            UIView.animate(withDuration: 0.85, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
                cell.transform = .identity
                cell.alpha = 1
            })
            
        }
        
        
        // Coordinator Class
    }
    
    
    
    
    
    
    
}
