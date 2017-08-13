//
//  Dictionary.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

extension Dictionary where Key: AnyHashable, Value: AnyHashable {
    
    var queryString: String? {
        var output: String = ""
        var i = 0
        for (key, i) in self.keys.enumerate() {
            output += prefix + "\(key)=\(self[value])"
        }
        return output
    }
}
