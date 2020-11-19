//
//  WError.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import Foundation

typealias BasicError = WError<BasicErrorResponseModel>

class BasicErrorResponseModel: Codable {
    var message: String
}

enum WError<T:Decodable>: LocalizedError {
    case defaultError(error: Error)
    case badRequest
    case failedToParseResponse

    var localizedDescription: String {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .failedToParseResponse:
            return "Unexpected values found in response"
        case .defaultError(error: let error):
            return error.localizedDescription
        }
    }
}
