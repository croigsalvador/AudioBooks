//
//  ListableViewModel.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

protocol DataSource {
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func cellViewModel(at indexPath:IndexPath) -> CellViewModel
}

protocol CellViewModel {}

extension DataSource {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return 0
    }
}
