//
//  ZoomedSelector.swift
//  KvShoppingInSwifUI
//
//  Created by Kevin Taniguchi on 1/23/21.
//  Copyright © 2021 Kevin Taniguchi. All rights reserved.
//

import Foundation
import SwiftUI

struct ZoomedImageSelector {
    var isZoomed: Bool = false
    var currentIndex: Int = 0 {
        didSet {
            if let scrolledToURL = urls?[currentIndex] {
                scrollView?.scrollTo(scrolledToURL, anchor: .center)
            }
        }
    }
    var scrollView: ScrollViewProxy?
    var urls: [URL]?
    
    mutating func setCurrentIndex(for selectedURL: URL, from urls: [URL]) {
        if let index = urls.firstIndex(where: { $0 == selectedURL }) {
            currentIndex = index
        }
    }
}
