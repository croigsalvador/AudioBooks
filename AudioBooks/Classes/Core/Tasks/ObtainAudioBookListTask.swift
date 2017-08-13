//
//  ObtainAudioBookListTask.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

class ObtainAudioBookListTask {
    
}

protocol DataTask {
    var baseURL: String {get}
    var timeForResource: Int {get}
    var timeForRequest: Int {get}
    func validResponse(response: URLResponse) -> Bool
    var session: URLSession {get}
}

extension DataTask {
    var baseURL: String {return "https://librivox.org/api/feed/audiobooks/?format=json"}
    var  timeForResource: Int {return 15}
    var  timeForRequest: Int {return 15}
    
    func validResponse(response: URLResponse) -> Bool {
        return (response as! HTTPURLResponse).statusCode == 200
    }
    
    var session: URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.sessionSendsLaunchEvents = true
        sessionConfig.httpMaximumConnectionsPerHost = 1
        sessionConfig.timeoutIntervalForRequest = TimeInterval(self.timeForRequest)
        sessionConfig.timeoutIntervalForResource = TimeInterval(self.timeForResource)
        
        return URLSession.init(configuration: sessionConfig)
    }
    
}
