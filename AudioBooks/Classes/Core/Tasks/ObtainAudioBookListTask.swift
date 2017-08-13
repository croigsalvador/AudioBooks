//
//  ObtainAudioBookListTask.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class ObtainAudioBookListTask: DataTask {
    
    func obtainAudioBookList(completion : @escaping (Data? , Bool) -> ()) {
        self.sendRequest{ (data, response, error) in
            if (!self.valid(response: response) || error != nil) {
                completion(nil, false)
            } else {
                completion(data, true)
            }
        }
    }
}

