//
//  AudioBookParser.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class AudioBookParser {
    
    func parse(json:[String:AnyObject]) -> AudioBook? {
        guard let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let authors = json["authors"] as? [[String:AnyObject]],
            authors.count > 0,
            let language = json["language"] as? String,
            let zipURL = json["url_zip_file"] as? String
            else {
                return nil
        }
        
        guard let author = authors.first! as? [String:AnyObject],
            let name = author["firs_name"] as? String,
            let lastName = author["last_name"] as? String else {
                return nil
        }
        
        let authorName = "\(name) \(lastName)"
        
        return AudioBook.init(id: id, title: title, author: authorName, description: description, language: language, zipURL: zipURL)
    }
    
}
