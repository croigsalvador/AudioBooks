//
//  ObtainAudioBookListRepository.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class ObtainAudioBookListRepository {
    
    fileprivate let provider: ObtainAudioBookListProvider
    fileprivate let inMemoryPersistor: AudioBookListInMemoryPersistor
    
    init(provider: ObtainAudioBookListProvider, inMemoryPersistor: AudioBookListInMemoryPersistor) {
        self.provider = provider
        self.inMemoryPersistor = inMemoryPersistor
    }
    
    func obtainaAudioBookList(completion:([AudioBook])->()) {
        provider.obtainAudioBookList { (data, success) in
            print(data)
        }
    }
    
    
}
