import Alamofire

enum Router: URLRequestConvertible {
    case getMarvelSuperHeroes()
    static let baseURLString = "https://api.myjson.com/bins/bvyob"
    
    var method: HTTPMethod {
        switch self {
        case .getMarvelSuperHeroes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMarvelSuperHeroes:
            return ""
        }
    }
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getMarvelSuperHeroes():
            urlRequest = try URLEncoding.default.encode(urlRequest, with: [:])
            
            return urlRequest
        }
    }
}
