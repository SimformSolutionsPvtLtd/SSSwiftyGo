//
//  Networking.swift
//  SwiftyGo_Example
//
//  Created by Hitarth on 14/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Combine

class Network {
    
    static var shared: Network = Network()
    private var session = URLSession.shared
    private init() {}
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    func performRequest<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
        
	}
        
    func getCharacters() -> AnyPublisher<(MarvelModel, MarvelModel, MarvelModel, MarvelModel), Error> {
        Publishers.Zip4(self.performRequest(eventUrl()),
                        self.performRequest(comicsUrl()),
                        self.performRequest(seriesUrl()),
                        self.performRequest(characterUrl()))
            .eraseToAnyPublisher()
    }

}
