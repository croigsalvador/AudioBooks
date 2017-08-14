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
    fileprivate let parser: AudioBookParser
    
    init(provider: ObtainAudioBookListProvider, inMemoryPersistor: AudioBookListInMemoryPersistor, parser: AudioBookParser) {
        self.provider = provider
        self.inMemoryPersistor = inMemoryPersistor
        self.parser = parser
    }
    
    func obtainaAudioBookList(completion:@escaping ([AudioBook]?)->()) {
        provider.obtainAudioBookList { (data, success) in
            guard let json = data,
                let books = json["books"] as? [[String:AnyObject]] else {
                completion(nil)
                return
            }
            var audioBooks = [AudioBook]()
            for book in books {
                if let audioBook = self.parser.parse(json: book) {
                    audioBooks.append(audioBook)
                }
            }
            self.inMemoryPersistor.save(audioBooks: audioBooks)
            completion(audioBooks)
        }
    }
    
    
}
