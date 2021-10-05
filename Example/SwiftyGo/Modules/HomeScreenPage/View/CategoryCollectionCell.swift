//
//  ProductCollectionCell.swift
//  TFOur Plus
//
//  Created by Hitarth on 02/06/21.
//

import UIKit



class CategoryCollectionCell: UICollectionViewCell {

    static let resueId: String = "CategoryCollectionCell"

    var carouselImage: UIImageView = {
        let i = UIImageView()

        i.translatesAutoresizingMaskIntoConstraints = false

        i.layer.cornerRadius = 5
        
        return i
    }()


    var cardView: UIView = {
       let card = UIView()

        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(white: 0, alpha: 0.4)
        card.layer.cornerRadius = 5

        return card
    }()


    var title: UILabel = {
        let t = UILabel()

        t.text = "DOORS"
        t.textColor = .white
        t.textAlignment = .center
        t.numberOfLines = 2
        t.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        t.translatesAutoresizingMaskIntoConstraints = false

        return t
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true

        addSubview(carouselImage)
        carouselImage.addSubview(cardView)
        carouselImage.addSubview(title)

        setupConstraints()

    }



    func setupConstraints() {

        NSLayoutConstraint.activate([

            carouselImage.topAnchor.constraint(equalTo: topAnchor),
            carouselImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            carouselImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            carouselImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            cardView.bottomAnchor.constraint(equalTo: carouselImage.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: carouselImage.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: carouselImage.trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 50),

            title.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: carouselImage.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: carouselImage.trailingAnchor),

        ])

    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
