//
//  NetworkManager.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

final class NetworkManager {
    private class func buildURL(endpoint: API)-> URLComponents {
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        return components
    }
    
    class func request<T: Decodable> (endpoint: API, completion: @escaping (Result<T,Error>)->Void){
        let components = buildURL(endpoint: endpoint)
        guard let url = components.url else {
            print("url creation error")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else { return }
            guard let data = data else {
                completion(.failure(APIErrors.noData))
                print(APIErrors.noData.localizedDescription)
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                completion(.failure(APIErrors.decoding))
                print(APIErrors.decoding.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
