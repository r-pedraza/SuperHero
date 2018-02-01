import XCTest
import Alamofire

class AlamofireRequestTests: XCTestCase {
    
    func testRequest() {
        let request = Router.getMarvelSuperHeroes()
        XCTAssertNotNil(request)
    }
    
    func testMarvelApi() {
        let request = Router.getMarvelSuperHeroes()
        let expect = expectation(description: "Get some marvels super heroes!")
        Alamofire.request(request)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    if let JSON = response.result.value as? [String: AnyObject], let superHeroesDic = JSON["superheroes"] as? [[String: AnyObject]]  {
                        debugPrint(superHeroesDic)
                        XCTAssertNotNil(JSON)
                        XCTAssertNotNil(superHeroesDic)
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
                expect.fulfill()
            })
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testParseMarvelModelWithApiResponse() {
        let request = Router.getMarvelSuperHeroes()
        let expect = expectation(description: "Get some marvels super heroes!")
        Alamofire.request(request)
            .validate(statusCode: 200..<300)
            .responseData(completionHandler: { (response) in
                    switch response.result {
                    case .success(let data):
                        let decoder = JSONDecoder()
                        do {
                            let response = try decoder.decode(SuperHeroes.self, from: data)
                            XCTAssertFalse(response.superheroes.isEmpty)
                        } catch let error as NSError {
                            debugPrint(error.localizedDescription)
                        }
                        
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                    }
                expect.fulfill()
                })
        waitForExpectations(timeout: 10, handler: nil)
    }
}

