//
//  PageResultsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct PageResultsMDB: Codable {
    public var page: Int!
    public var total_results: Int!
    public var total_pages: Int!
}
