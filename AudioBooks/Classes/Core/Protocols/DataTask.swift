//
//  DataTask.swift
//  AudioBooks
//
//  Created by Carlos Roig on 13/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

protocol DataTask {
    var baseURL: String {get}
    var request:URLRequest {get}
    var timeForResource: Int {get}
    var timeForRequest: Int {get}
    var session: URLSession {get}
    func valid(response: URLResponse?) -> Bool
    func sendRequest(with completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

extension DataTask {
    var baseURL: String {return "https://librivox.org/api/feed/audiobooks/?format=json&"}
    var request: URLRequest {
        let url = URL.init(string:baseURL)
        return URLRequest(url: url!)
    }
    var  timeForResource: Int {return 15}
    var  timeForRequest: Int {return 15}
    
    func valid(response: URLResponse?) -> Bool {
        guard let response = response else {
            return false
        }
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
    
    func sendRequest(with completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
    }
}
