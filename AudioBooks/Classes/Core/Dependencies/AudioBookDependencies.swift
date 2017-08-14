//
//  AudioBookDependencies.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class AudioBookDependencies {
    
    class func audioBooksRiverViewController() -> AudioBooksRiverViewController {
        let repository = ObtainAudioBookListRepository.init(provider: ObtainAudioBookListProvider(), inMemoryPersistor: AudioBookListInMemoryPersistor(), parser: AudioBookParser())
        let useCase = ObtainAudioBookList.init(repository: repository, mapper: AudioBookViewModelMapper())
        
        let presenter = AudioBooksRiverPresenter.init(obtainAudioBookList:useCase)
        
        return AudioBooksRiverViewController.init(presenter: presenter)
    }

}
