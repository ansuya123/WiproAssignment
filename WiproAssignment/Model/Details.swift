//
//  Details.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import Foundation

class Details: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
    let id: UUID = UUID()
    
    enum CodingKeys: String, CodingKey {
        case title, description, imageHref
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref) ?? ""
    }
}

class APIReponse: Codable {
    var title: String
    var rows: [Details]
    
    enum CodingKeys: String, CodingKey {
        case title, rows
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.rows = try values.decodeIfPresent([Details].self, forKey: .rows) ?? []
    }
}
