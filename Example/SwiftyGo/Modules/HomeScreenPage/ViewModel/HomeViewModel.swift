//
//  HomeViewModel.swift
//  Demo
//
//  Created by Hitarth on 30/09/21.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    static var shared = HomeViewModel()
    
    @Published var newsData: NewsModel?
    var cancellable = Set<AnyCancellable>()
    
    func getData() {
        Network.shared.getNews()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finish")
                case .failure(let error):
                    print("error is: ", error)
                }
            } receiveValue: { data in
                self.newsData = data
            }
            .store(in: &cancellable)
    }
    
}
