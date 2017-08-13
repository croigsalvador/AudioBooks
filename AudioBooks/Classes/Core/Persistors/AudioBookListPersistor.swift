//
//  AudioBookListPersistor.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class AudioBookListInMemoryPersistor {

    private var audioBooks = [AudioBook]()
    
    func fetchAudioBooks() -> [AudioBook] {
        return audioBooks
    }
    
    func save(audioBooks: [AudioBook]) {
        self.audioBooks = audioBooks
    }

}
