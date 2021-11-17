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
    @Published var marvelData = [HomeSection: [MarvelViewModel]]()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getData()
    }
    
    func getData() {
        Network.shared.getCharacters()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finish")
                case .failure(let error):
                    print("Error is ", error)
                }  
            } receiveValue: { (event, comics, series, character) in
                self.marvelData[.Event] = event.data.results.map(MarvelViewModel.init)
                self.marvelData[.Comics] = comics.data.results.map(MarvelViewModel.init)
                self.marvelData[.Series] = series.data.results.map(MarvelViewModel.init)
                self.marvelData[.Characters] = character.data.results.map(MarvelViewModel.init)
            }.store(in: &cancellable)
    }
}
