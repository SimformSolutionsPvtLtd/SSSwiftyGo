//
//  News.swift
//  Demo
//
//  Created by Hitarth on 01/10/21.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, articleDescription: String?
    let urlToImage: String?

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case urlToImage
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
