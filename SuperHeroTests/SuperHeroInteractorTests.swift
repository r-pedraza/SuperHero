import XCTest

class SuperHeroInteractorTests: XCTestCase {
    var interactor: SuperHeroInteractor!
    var repository: SuperHeroRepository!
    override func setUp() {
        super.setUp()
        repository = SuperHeroRepository()
        interactor = SuperHeroInteractor(repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
    }
    
    func testAllSuperHeroesIsNotEmpty() {
        let expect = expectation(description: "Get some marvels super heroes!")
        interactor.execute {
            XCTAssertTrue(!self.interactor.allSuperHeroes().isEmpty)
            expect.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSuperHeroAtIndex() {
        let expect = expectation(description: "Get some marvels super heroes!")
        interactor.execute {
            let indexPath = IndexPath(row: 0, section: 0)
            let superHero = self.interactor.superHero(at: indexPath)
            XCTAssertNotNil(superHero.name)
            XCTAssertNotNil(superHero.photo)
            XCTAssertNotNil(superHero.realName)
            XCTAssertNotNil(superHero.height)
            XCTAssertNotNil(superHero.power)
            XCTAssertNotNil(superHero.groups)
            expect.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
