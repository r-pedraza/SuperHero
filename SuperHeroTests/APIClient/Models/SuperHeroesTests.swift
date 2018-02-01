import XCTest

class SuperHeroesTests: XCTestCase {
    
    func testDecoderSuperHeroes() {
        do {
            let spidermanDic = ["name": "Spiderman", "photo": "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg", "realName": "Peter Benjamin Parker", "height": "1.77m", "power": "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.", "abilities": "Peter is an accomplished scientist, inventor and photographer.", "groups": "Avengers, formerly the Secret Defenders, \"New Fantastic Four\", the Outlaws"]
            
            let captainDic = ["name": "Captain Marvel", "photo": "https://i.annihil.us/u/prod/marvel/i/mg/c/10/537ba5ff07aa4/standard_xlarge.jpg", "realName": "Carol Danvers", "height": "1.80m", "power": "Ms. Marvel's current powers include flight, enhanced strength, durability and the ability to shoot concussive energy bursts from her hands.", "abilities": "Ms. Marvel is a skilled pilot & hand to hand combatant", "groups": "Avengers, formerly Queen's Vengeance, Starjammers"]
            
            let JSON = ["superheroes": [spidermanDic, captainDic]]
            
            let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
            let results = try SuperHeroes.decode(data: jsonData)
            if let superHero = results.superheroes.first {
                print(superHero)
                XCTAssertNotNil(superHero)
                XCTAssertEqual(superHero.name, "Spiderman")
                XCTAssertEqual(superHero.realName, "Peter Benjamin Parker")
                XCTAssertEqual(superHero.height, "1.77m")
            }
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
}
