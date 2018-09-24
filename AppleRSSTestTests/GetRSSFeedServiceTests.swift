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
    var mockNetworkAdapter: MockSuccessfulNetworkAdapter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockNetworkAdapter = MockSuccessfulNetworkAdapter()
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
    
    func testCanReadFeed() {
        
        sut.get { response in
            
            switch response {
            case .success(let data):
                XCTAssertNotNil(data, "Response should not be nil")
            case .failure(_):
                XCTFail()
            }
        }
        XCTAssert(mockNetworkAdapter.getWasCalled == true, "Should call get()")
        
    }
    
    func testCanHandleError() {
        let mockUnSuccessfulNetworkAdapter = MockUnSuccessfulNetworkAdapter()
        sut = GetRSSFeedService(url: URL(string: "https://example.com")!, networkAdapter: mockUnSuccessfulNetworkAdapter)
        
        sut.get { response in
            
            switch response {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
        XCTAssert(mockUnSuccessfulNetworkAdapter.getWasCalled == true, "Should call get()")
        
    }

}

let successfulResponse = Response.success(Data())
let error = NSError(domain: "X", code: 123, userInfo: nil)
let unsuccessfulResponse = Response<JsonData>.failure(.errorTypeHTTPFailure)
class MockSuccessfulNetworkAdapter: NetworkAdapter {

    var getWasCalled = false
 
    func get(completionHandler: @escaping CompletionHandler) {
        getWasCalled = true
        completionHandler(successfulResponse)
    
    }
}

class MockUnSuccessfulNetworkAdapter: NetworkAdapter {
    
    var getWasCalled = false
    
    func get(completionHandler: @escaping CompletionHandler) {
        getWasCalled = true
        completionHandler(unsuccessfulResponse)
        
    }
    
}
