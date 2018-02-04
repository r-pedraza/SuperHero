import XCTest

class SuperHeroMapperTests: XCTestCase {
    let mapper = SuperHeroMapper()
    let spidermanDic = ["name": "Spiderman", "photo": "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg", "realName": "Peter Benjamin Parker", "height": "1.77m", "power": "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.", "abilities": "Peter is an accomplished scientist, inventor and photographer.", "groups": "Avengers, formerly the Secret Defenders, \"New Fantastic Four\", the Outlaws"]
    let captainDic = ["name": "Captain Marvel", "photo": "https://i.annihil.us/u/prod/marvel/i/mg/c/10/537ba5ff07aa4/standard_xlarge.jpg", "realName": "Carol Danvers", "height": "1.80m", "power": "Ms. Marvel's current powers include flight, enhanced strength, durability and the ability to shoot concussive energy bursts from her hands.", "abilities": "Ms. Marvel is a skilled pilot & hand to hand combatant", "groups": "Avengers, formerly Queen's Vengeance, Starjammers"]

    func testMapperData() {
        do {
            let data = try ["superheroes": [spidermanDic, captainDic]].encode()
            let  response = try mapper.process(data: data)
            XCTAssertTrue(!response.superheroes.isEmpty)
        } catch let error {
            debugPrint(error)
        }
    }
    
    func testMapperError() {
        do {
            let data = try [[spidermanDic, captainDic]].encode()
            let  _ = try mapper.process(data: data)
        } catch let error {
            debugPrint(error)
            XCTAssertNotNil(error)
        }
    }
}
