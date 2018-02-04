import XCTest

class URLSessionRequestTests: XCTestCase {
    
    func testMarvelApi() {
        let expect = expectation(description: "Get some marvels super heroes!")
        SuperHeroAPIClient().getSuperHeroes(completionhandler: { data in
            expect.fulfill()
            XCTAssertNotNil(data)
        }) { error in
            expect.fulfill()
            XCTAssertNotNil(error)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}

