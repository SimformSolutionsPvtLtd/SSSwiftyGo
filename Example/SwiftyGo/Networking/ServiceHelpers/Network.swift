
import Alamofire
import UIKit
import Combine


typealias HTTPResponse<T: Decodable> = (Result<T, GenericResponse>) -> Void

enum NetworkError: Error {
    case OptionalError
    case DecodingDataError
}


class Network {
    
    static var shared: Network = Network()
    private var cancellable = Set<AnyCancellable>()
    
    private init() {}
    
    func performRequest<T: Decodable>(_ router: APIConfiguration) -> Future<T, Error> {
        
        return Future<T, Error> { [weak self] promise in
            
            guard let self = self else { return promise(.failure(NetworkError.OptionalError)) }
            
            AF.request(router.returnUrl(), method: router.method, parameters: router.parameters, encoding: JSONEncoding.default)
                .publishDecodable(type: T.self, queue: .main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                            default:
                                print("Unknown Error")
                        }
                    }
                } receiveValue: {
                    
                    guard let data = $0.value else {return promise(.failure(NetworkError.DecodingDataError))}
                    promise(.success(data))
                }
                .store(in: &self.cancellable)
            
        }
  
	}
    
    
    //MARK:- Parent Cateogory Network Method
    func getNews() -> Future<NewsModel, Error> {
        self.performRequest(DiscoveryAPIRouter.newsApi)
    }
    
    
    
}
