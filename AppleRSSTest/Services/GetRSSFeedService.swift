//
//  GetRSSFeedService.swift
//  AppleRSSTest
//
//  Created by Trevor Doodes on 23/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import Foundation

enum ErrorType {
    case errorTypeHTTPFailure
}

enum Response<T> {
    case success(T)
    case failure(ErrorType)
}

typealias JsonData = Data
typealias CompletionHandler = (Response<JsonData>) -> ()

protocol NetworkAdapter {
    func get(completionHandler: @escaping CompletionHandler)
}

class GetRSSFeedService {
    
    private(set) var url: URL
    private(set) var networkAdapter: NetworkAdapter
    
    init (url: URL, networkAdapter: NetworkAdapter) {
        self.url = url
        self.networkAdapter = networkAdapter
    }
    
    func get(completionHandler: @escaping CompletionHandler) {
        networkAdapter.get (completionHandler: completionHandler)
    }
}
