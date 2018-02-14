import XCTest

class SuperHeroRepositoryTests: XCTestCase {
    var repository = SuperHeroRepository()
    let superHeroStorage = SuperHeroStorage()

    func testGetAllItems() {
        let expect = expectation(description: "Get some marvels super heroes!")
        repository.fetchAllItems(completionHandler: { superHeroes in
            XCTAssertTrue(!superHeroes.isEmpty)
            expect.fulfill()
        }) { error in
            expect.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetItemAtIndex() {
        let expect = expectation(description: "Get some marvels super heroes!")
        repository.fetchAllItems(completionHandler: { superHeroes in
            let indexPath = IndexPath(row: 0, section: 0)
            let superHero = self.repository.fetchItem(at: indexPath)
            XCTAssertNotNil(superHero.name)
            XCTAssertNotNil(superHero.photo)
            XCTAssertNotNil(superHero.realName)
            XCTAssertNotNil(superHero.height)
            XCTAssertNotNil(superHero.power)
            XCTAssertNotNil(superHero.groups)
            expect.fulfill()
        }) { error in
            expect.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testStorageAdd() {
        let superHero = SuperHero(name: "Raúl", photo: "", realName: "", height: "", power: "", abilities: "", groups: "")
        superHeroStorage.add(superHero: superHero)
        let recoverSuperHeroStorage = superHeroStorage.superHeroes().first
        XCTAssertTrue(recoverSuperHeroStorage?.name == "Raúl")
        XCTAssertTrue(superHeroStorage.superHeroes().count == 1)
    }
}
