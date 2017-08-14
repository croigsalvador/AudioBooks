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
    fileprivate let mapper: AudioBookViewModelMapper
    fileprivate var audioBookViewModels = [AudioBookViewModel]()
    
    init(repository: ObtainAudioBookListRepository, mapper: AudioBookViewModelMapper) {
        self.repository = repository
        self.mapper = mapper
    }
    
    
    func obtainaAudioBookList(completion:@escaping ([AudioBookViewModel])->()) {
        repository.obtainaAudioBookList{(audioBooks) in
            if let audioBooks = audioBooks {
                self.audioBookViewModels = self.mapper.map(audioBooks: audioBooks)
            }
            completion(self.audioBookViewModels)
        }
    }
    
}
