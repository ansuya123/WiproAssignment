//
//  APIRouter.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import Foundation

public typealias Parameters = [String: Any]

class Service {
    struct Server {
        static let baseURL = "https://dl.dropboxusercontent.com/s/"
    }
    
    struct APIParameterKey {
    }
}

enum HTTPMethod: String {
    case GET = "GET"
}

enum APIRouter {
    // Auth APIs
    case getDetails
}

extension APIRouter {
    // MARK: - Path
    public var path: String {
        switch self {
        case .getDetails:
            return "2iodh4vg0eortkl/facts.json"
        }
    }
    
    // MARK: - Parameters
    public var parameters: Parameters? {
        switch self {
        case .getDetails:
            return nil
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getDetails:
            return .GET
        default:
            return .GET
        }
    }
}
