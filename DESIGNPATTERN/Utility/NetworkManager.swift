//  Created by Rohit Chauhan on 03/09/22.

import Foundation
import Alamofire

class NetworkManager {
    enum APIError: Error {
        case invalidUrl, invalidResponseFormat, unknow
    }
    
    func getRequest<Model: Decodable>(with url: String, completionHandler:@escaping (Result<Model, NetworkManager.APIError>)-> Void) {
        guard let _ = URL(string: url) else {
            completionHandler(.failure(.invalidUrl))
            return
        }
        
        AF.request(url).response { response in
            if let _ = response.error {
                completionHandler(.failure(.unknow))
                return
            }
            
            if let data = response.data, let model = try? JSONDecoder().decode(Model.self, from: data) {
                completionHandler(.success(model))
                return
            }
            
        }
        
    }

}
