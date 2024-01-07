//
//  ExternalIdsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class ExternalIdsMDB: Decodable {
    public var imdb_id: String?
    public var freebase_mid: String?
    public var id: Int!
    public var freebase_id: String?
    public var tvdb_id: Int?
    public var tvrage_id: Int?
}
