//
//  GetRSSFeedService.swift
//  AppleRSSTestTests
//
//  Created by Trevor Doodes on 23/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import XCTest
@testable import AppleRSSTest

class GetRSSFeedServiceTests: XCTestCase {
    
    var sut: GetRSSFeedService!
    var mockNetworkAdapter: NetworkAdapter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockNetworkAdapter = MockNetworkAdapter()
        sut = GetRSSFeedService(url: URL(string: "https://example.com")!, networkAdapter: mockNetworkAdapter)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanCreateGetRSSFeedService() {
        XCTAssertNotNil(sut, "Should be able to create GetRSSFeedService")
    }
    
    func testCanSetURLForGetRSSFeedService() {
        XCTAssertNotNil(sut.url, "Should set URL")
        XCTAssert(sut.url.absoluteString == "https://example.com", "Should be able to set url")
    }
    
    func testCanSetNetworkAdapter() {
        XCTAssertNotNil(sut.networkAdapter, "Should be able to set network adapter")
    }
    
    

}

class MockNetworkAdapter: NetworkAdapter {
    
    func get() {
        
    }
    
}
