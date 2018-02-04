import Foundation

extension String: Error {}

class SuperHeroAPIClient {
    func getSuperHeroes(completionhandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        let request = Router.getMarvelSuperHeroes()
        guard let urlRequest = try? request.asURLRequest() else {
            errorHandler("No url request")
            return
        }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                completionhandler(data)
            } else {
                errorHandler(error ?? "Desconocido")
            }
        }).resume()
    }
}
