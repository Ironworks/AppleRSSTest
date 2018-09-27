//
//  FeedModelTests.swift
//  AppleRSSTestTests
//
//  Created by Trevor Doodes on 26/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import XCTest
@testable import AppleRSSTest

class FeedModelTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCanReadFile () {
        let jsonData = jsonReader()
        print(jsonData)
        

            //created the json decoder
            let decoder = JSONDecoder()
            
            //using the array to put values
        let feed  = try! decoder.decode(Top.self, from: jsonData)
            print(feed)
        
    }
    
    
    func jsonReader()  -> Data {
        let testBundle = Bundle(for: type(of: self))
        let fileURL = testBundle.url(forResource: "feed", withExtension: "json")
        
        let jsonData = try! Data(contentsOf: fileURL!, options: .alwaysMapped)
        
        return jsonData
    }

}


