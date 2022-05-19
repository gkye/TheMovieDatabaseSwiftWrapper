//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class ImageMDB: Codable {
    open var aspect_ratio: Double?
    open var file_path: String?
    open var height: Int?
    open var iso_639_1: String?
    open var vote_average: Double?
    open var vote_count: Int?
    open var width: Int?

}

public struct ImagesMDB: Codable {
    public var backdrops = [ImageMDB]()
    public var posters = [ImageMDB]()
    public var stills = [ImageMDB]()
    public var id: Int!

    enum CodingKeys: String, CodingKey {
        case id
        case stills = "logos"
        case posters
        case backdrops
    }
}
