//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct AltTitlesMDB: Codable {
    public var title: String?
    public var iso_3166_1: String?
    public var type: String?
}
public struct AlternativeTitlesMDB: Codable {
    public var id: Int!
    public var titles = [AltTitlesMDB]()
}
