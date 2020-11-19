//
//  APIClient.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import Foundation

class APIClient {
    class var shared: APIClient {
        struct Singleton {
            static let instance = APIClient()
        }
        return Singleton.instance
    }
    
    func request<Success: Decodable, Failure: Decodable>(_ path: String, method: HTTPMethod = .GET, parameters: Parameters? = nil, successClass: Success.Type, failureErrorClass: Failure.Type, onCompletion completion: ((Result<Success, WError<Failure>>) -> Void)?) {
        
        debugPrint("API : \(Service.Server.baseURL + path)", method.rawValue)
        debugPrint("Parameters : \(String(describing: parameters))\n")
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = URL(string: Service.Server.baseURL + path) as URL?
        request.httpMethod = method.rawValue
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            DispatchQueue.main.async {
                guard let data = data else {
                    if let error = error {
                        debugPrint("error", error.localizedDescription)
                        completion?(.failure(WError.defaultError(error: error)))
                        return
                    }
                    completion?(.failure(WError.badRequest))
                    return
                }
                
                do {
                    guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else {
                        completion?(.failure(WError.failedToParseResponse))
                        return
                    }
                    guard let properData = string.data(using: .utf8, allowLossyConversion: true) else {
                        completion?(.failure(WError.failedToParseResponse))
                        return
                    }

                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    let parsedJSON = try jsonDecoder.decode(Success.self, from: properData)
                    debugPrint("parsedJSON", parsedJSON)
                    completion?(.success(parsedJSON))
                }
                catch {
                    completion?(.failure(WError.failedToParseResponse))
                }
            }
        })
        task.resume()
    }
}
