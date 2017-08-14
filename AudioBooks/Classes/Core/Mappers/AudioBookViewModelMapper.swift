//
//  AudioBookViewModelMapper.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

struct AudioBookViewModelMapper {
    
    func map(audioBooks: [AudioBook]) -> [AudioBookViewModel] {
        let viewModels = audioBooks.map({
            (audioBook: AudioBook) -> AudioBookViewModel in
            return AudioBookViewModel(audioBook: audioBook)
        })
        
        return viewModels
    }
}
