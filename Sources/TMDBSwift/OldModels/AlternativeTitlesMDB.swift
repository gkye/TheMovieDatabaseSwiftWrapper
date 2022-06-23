//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct AltTitlesMDB: Decodable {
    public var title: String?
    public var iso_3166_1: String?
    public var type: String?
}

public struct AlternativeTVTitlesMDB: Decodable {
    public var id: Int?
    public var titles: [AltTitlesMDB]?

    enum CodingKeys: String, CodingKey {
        case id
        case titles = "results"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int?.self, forKey: .id)
        titles = try? container.decode([AltTitlesMDB]?.self, forKey: .titles)
    }
}

public struct AlternativeMovieTitlesMDB: Decodable {
    public var id: Int?
    public var titles: [AltTitlesMDB]?
}
