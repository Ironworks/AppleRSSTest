//
//  GetRSSFeedService.swift
//  AppleRSSTest
//
//  Created by Trevor Doodes on 23/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import Foundation

protocol NetworkAdapter {
    func get()
}

class GetRSSFeedService {
    
    private(set) var url: URL
    private(set) var networkAdapter: NetworkAdapter
    
    init (url: URL, networkAdapter: NetworkAdapter) {
        self.url = url
        self.networkAdapter = networkAdapter
    }
    
}
