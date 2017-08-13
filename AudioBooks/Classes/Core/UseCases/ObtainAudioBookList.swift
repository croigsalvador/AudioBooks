//
//  ObtainAudioBookList.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class ObtainAudioBookList {
    
    fileprivate let repository: ObtainAudioBookListRepository
    
    init(repository: ObtainAudioBookListRepository) {
        self.repository = repository
    }
    
    
    func obtainaAudioBookList(completion:([AudioBook])->()) {
        repository.obtainaAudioBookList{(audioBooks) in
            completion(audioBooks)
        }
    }
    
}
