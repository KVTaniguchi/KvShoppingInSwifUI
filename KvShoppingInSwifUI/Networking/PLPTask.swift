//
//  Networking.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 8/16/20.
//  Copyright © 2020 Kevin Taniguchi. All rights reserved.
//

import Foundation
import Combine

enum HTTPError: LocalizedError {
    case statusCode
}

class PLPProductsTask: ObservableObject {
    private var cancellable: AnyCancellable?
    let url: URL
    
    private static let formatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
    @Published var finished = false
    @Published var result: Result<[PLPViewModel], Error>?
    
    init(url: URL) {
        self.url = url
    }
    
    func getProducts() {
        guard !finished else { return }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
        .decode(type: [PLPProduct].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] completion in
            self?.finished = true
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self?.result = .failure(error)
            }
        }, receiveValue: { [weak self] products in
            let productViewModels: [PLPViewModel] = products.map { product in
                let listingRaw = Decimal(integerLiteral: product.listingPrice) / 100
                let listingPriceString = PLPProductsTask.formatter.string(from:
                    NSDecimalNumber(decimal: listingRaw))
                let saleRaw = Decimal(
                    integerLiteral: product.salePrice) / 100
                let salePriceString = product.onSale ? PLPProductsTask.formatter.string(
                from: NSDecimalNumber(decimal: saleRaw)) : nil
                return PLPViewModel(
                    id: product.id,
                    imageUrl: product.image,
                    name: product.name,
                    listingPriceDisplay: listingPriceString ?? "",
                    salePriceDisplay: salePriceString ?? "",
                    averageRating: 0,
                    numberOfReviews: 0,
                    shortPromoMessage: product.promoMessage
                )
            }
            self?.result = .success(productViewModels)
        })
    }
}
