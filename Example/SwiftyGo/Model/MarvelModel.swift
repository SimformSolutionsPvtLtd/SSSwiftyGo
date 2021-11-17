//
//  MarvelModel.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 12/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct MarvelModel: Codable {
    var data: MarvelData
}

// MARK: - DataClass
struct MarvelData: Codable {
    var count: Int
    var results: [MarvelResult]
}

// MARK: - Result
struct MarvelResult: Codable {
    var id: Int?
    var title: String?
    var name: String?
    var description: String?
    var thumbnail: [String: String]?
    var urls: [[String: String]]?
}
