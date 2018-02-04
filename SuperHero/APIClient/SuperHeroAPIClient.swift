import Foundation
import Alamofire

class SuperHeroAPIClient {
    
    func getSuperHeroes(completionhandler: @escaping (Data)->(), errorHandler: @escaping (NSError)->()) {
        let request = Router.getMarvelSuperHeroes()
        Alamofire.request(request)
            .validate(statusCode: 200..<300)
            .responseData(completionHandler: { (response) in
                switch response.result {
                case .success(let data):
                    completionhandler(data)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    errorHandler(error as NSError)
                }
            })
    }
}
