//
//  MovieReleaseDatesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class MovieReleaseDatesMDB: Decodable {
    public var iso_3166_1: String?
    public var release_dates = [ReleaseDates]()
}

// move inside class?
public struct ReleaseDates: Decodable {
    public var certification: String?
    public var iso_639_1: String?
    public var note: String?
    public var release_date: String? // change to formatted NSDate later??
    public var type: Int?
}
