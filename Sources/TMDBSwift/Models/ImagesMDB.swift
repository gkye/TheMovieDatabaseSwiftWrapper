//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class ImageMDB: Decodable {
    public var aspect_ratio: Double?
    public var file_path: String?
    public var height: Int?
    public var iso_639_1: String?
    public var vote_average: Double?
    public var vote_count: Int?
    public var width: Int?
}

public struct ImagesMDB: Decodable {
    public var backdrops: [ImageMDB]?
    public var posters: [ImageMDB]?
    public var logos: [ImageMDB]?
    public var stills: [ImageMDB]?
    public var id: Int!

    enum CodingKeys: String, CodingKey {
        case id
        case stills
        case logos
        case posters
        case backdrops
    }
}
