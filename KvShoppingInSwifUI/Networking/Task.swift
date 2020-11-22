//
//  Task.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/22/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation
import Combine

class FetchTask<T: Decodable>: ObservableObject {
    
    private var cancellable: AnyCancellable?
    let url: URL
    
    @Published var model: T?
    @Published var error: Error?
    @Published var finished = false
    
    init(url: URL) {
        self.url = url
    }
    
    func updateUser() {
        
    }
    
    func fetchModel() {
        guard !finished else { return }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
            .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] completion in
            self?.finished = true
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self?.error = error
            }
        }, receiveValue: { [weak self] model in
            self?.model = model
        })
    }
}
