//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct AltTitlesMDB: ArrayObject {
    public var title: String?
    public var iso_3166_1: String?
    public init(results: JSON) {
        title = results["title"].string
        iso_3166_1 = results["iso_3166_1"].string

    }
}
public struct AlternativeTitlesMDB {

    public var id: Int!
    public var titles = [AltTitlesMDB]()

    public init(results: JSON) {
        id = results["id"].int
        if results["results"].exists() { // TV Changes
            titles = AltTitlesMDB.initialize(json: results["results"])

        } else if results["titles"].exists() {
            titles = AltTitlesMDB.initialize(json: results["titles"])
        }
    }
}
