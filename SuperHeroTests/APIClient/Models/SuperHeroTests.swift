import XCTest

class SuperHeroTests: XCTestCase {
    
    func testDecoderSuperHero() {
        do {
            let JSON = ["name": "Spiderman", "photo": "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg", "realName": "Peter Benjamin Parker", "height": "1.77m", "power": "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.", "abilities": "Peter is an accomplished scientist, inventor and photographer.", "groups": "Avengers, formerly the Secret Defenders, \"New Fantastic Four\", the Outlaws"]
            
            let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
            let superHero = try SuperHero.decode(data: jsonData)
            print(superHero)
            XCTAssertNotNil(superHero)
            XCTAssertEqual(superHero.name, "Spiderman")
            XCTAssertEqual(superHero.realName, "Peter Benjamin Parker")
            XCTAssertEqual(superHero.height, "1.77m")
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
}
