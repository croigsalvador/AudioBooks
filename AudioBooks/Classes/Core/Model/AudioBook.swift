//
//  Book.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

struct AudioBook {
    let id: Int
    let title: String
    let author: String
    let description: String
    let language: String
    let zipURL: String
    
    init(id: Int, title: String, author: String, description: String, language: String, zipURL:String) {
        self.id = id
        self.title = title
        self.author = author
        self.description = description
        self.language = language
        self.zipURL = zipURL
    }
}
