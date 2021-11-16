//
//  MarvelViewModel.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

enum HomeSection: String, CaseIterable {
    case Event
    case Comics
    case Series
    case Characters
}

struct MarvelViewModel: Identifiable {
    
    var id: Int
    var title: String
    var description: String
    var imageUrl: URL?
    var urlLink: [URL]?
    var urlType: [String]?
    var rating: Double
    var rank: String?
    
    static var `default`: MarvelViewModel {
        get {
            MarvelViewModel(marvelData: MarvelResult(id: 0, title: "", name: "", description: "", thumbnail: ["":""], urls: [["": ""]]))
        }
    }
 
    init(marvelData: MarvelResult) {
        self.id = marvelData.id ?? 0
        self.title = (marvelData.name?.isEmpty ?? true) ? marvelData.title ?? "" : marvelData.name ?? ""
        self.description = marvelData.description ?? ""
        self.rating = Double.random(in: 1.0...5.0)
        self.imageUrl = extractImageUrl(data: marvelData.thumbnail ?? ["": ""])
        self.urlLink = extractUrl(data: marvelData.urls ?? [["": ""]])
        self.urlType = extractUrlType(data: marvelData.urls ?? [["": ""]])
        
        let ranks = ["A","B","C","D","S","F","Z"]
        self.rank = ranks.randomElement()
    }
    
    
    func extractImageUrl(data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
    }
    
    func extractUrl(data: [[String: String]]) -> [URL] {
        var urls = [URL]()
        for data in data {
            let url = data["url"] ?? ""
            urls.append(URL(string: url)!)
        }
        
        return urls
    }
    
    func extractUrlType(data: [[String: String]]) -> [String] {
        var types = [String]()
        for data in data {
            var type = data["type"] ?? ""
            type = type.capitalized
            types.append(type)
        }
        
        return types
    }
    
}
