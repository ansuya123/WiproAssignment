//
//  CountryViewTestClass.swift
//  WiproAssignmentTests
//
//  Created by Anasuya Polu on 2020-11-20.
//

@testable import WiproAssignment
import XCTest

class CountryViewTestClass: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    // MARK: - API Success Tests
    func testGetDetailsSuccess() {
        let expectation = XCTestExpectation(description: "Get County Details - Success")
              
        APIClient.shared.getCountyDetails { result in
            switch result {
            case .success(let response):
                XCTAssert(!response.title.isEmpty, "County title should not be empty")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Should not get the error : \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
       
    // MARK: - API Failure Tests
    func testGetDetailsFailure() {
        let expectation = XCTestExpectation(description: "Get County Details - Failure")
              
        APIClient.shared.getCountyDetails { result in
            switch result {
            case .success(let response):
                XCTFail("Basically API should not get the response : \(response.title), but we don't have otion to test failure case")
            case .failure(let error):
                XCTAssert(!error.localizedDescription.isEmpty, "Should get error message")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
      }
}
