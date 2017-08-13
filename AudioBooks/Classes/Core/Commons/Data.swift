//
//  Dats.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

extension Data {
    func JSON<T>() -> T? {
        guard let json = try? JSONSerialization.jsonObject(with: self) as? T else {
            return nil
        }
        return json
    }
}
