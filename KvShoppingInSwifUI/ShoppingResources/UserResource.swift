//
//  UserResource.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 11/15/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation

// create at top level and add to main stack
// https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec
final class UserResource: ObservableObject {
    var user: User = User()
    
    // possible user states
    
    // updated
    
    
    // not updated, in guest state non-updated
    let userFetchTaskUnMutated = UserFetchTask(url: URL(string: "https://run.mocky.io/v3/2700ae5c-f55d-4795-8ef8-ec39068871ec")!)
    
    func load() {
        userFetchTaskUnMutated.getUser()
    }
}

enum GuestState {
    case service
    case local
}

import Foundation
import Combine

class UserFetchTask: ObservableObject {
    private var cancellable: AnyCancellable?
    let url: URL
    
    @Published var user: UserModel?
    @Published var error: Error?
    @Published var finished = false
    
    init(url: URL) {
        self.url = url
    }
    
    func updateUser() {
        
    }
    
    func getUser() {
        guard !finished else { return }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
        .decode(type: UserModel.self, decoder: JSONDecoder())
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
        }, receiveValue: { [weak self] user in
            self?.user = user
        })
    }
}
