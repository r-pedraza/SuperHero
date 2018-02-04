import Foundation

extension String: Error {}

class SuperHeroAPIClient {
    func getSuperHeroes(completionhandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let URL = URL(string: "https://api.myjson.com/bins/bvyob") else { return }
        let request = URLRequest(url: URL)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                completionhandler(data)
            } else {
                errorHandler(error ?? "Desconocido")
            }
        }).resume()
    }
}
