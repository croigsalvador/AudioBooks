//
//  ObtainAudioBookListProvider.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class ObtainAudioBookListProvider {
    
    func obtainAudioBookList(completion: @escaping ([String : AnyObject]?, Bool  ) -> ()) {
        let task = ObtainAudioBookListTask()
        task.obtainAudioBookList { (data, success) in
            if let data = data, let item:[String:AnyObject] = data.JSON(),success {
                completion(item, success)
            } else {
                completion(nil, success)
            }
        }
    }
    
}
