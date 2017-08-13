//
//  Book.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

struct AudioBook {
    let name: String
    let author: String
    let description: String
    
    init(name: String, author: String, description: String) {
        self.name = name
        self.author = author
        self.description = description
    }
}
