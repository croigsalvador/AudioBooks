//
//  AudioBookViewmodel.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

struct AudioBookViewModel : CellViewModel {
    let title: String
    let author: String
    
    init(audioBook: AudioBook) {
        self.title = audioBook.title
        self.author = audioBook.author
    }
}

struct RiverHeaderViewModel : HeaderViewModel {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
