//
//  MovieReleaseDatesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class MovieReleaseDatesMDB: Codable {
    open var iso_3166_1: String?
    open var release_dates = [ReleaseDates]()
}

// move inside class?
public struct ReleaseDates: Codable {
    public var certification: String?
    public var iso_639_1: String?
    public var note: String?
    public var release_date: String? // change to formatted NSDate later??
    public var type: Int?
}
