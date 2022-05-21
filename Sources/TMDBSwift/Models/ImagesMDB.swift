//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class ImageMDB: ArrayObject {
    open var aspect_ratio: Double?
    open var file_path: String?
    open var height: Int?
    open var iso_639_1: String?
    open var vote_average: Double?
    open var vote_count: Int?
    open var width: Int?

    required public init(results: JSON) {
        aspect_ratio = results["aspect_ratio"].double
        file_path = results["file_path"].string
        height = results["height"].int
        iso_639_1 = results["iso_639_1"].string
        vote_average = results["vote_average"].double
        vote_count = results["vote_count"].int
        width = results["width"].int
    }

}

public struct ImagesMDB {
    public var backdrops = [ImageMDB]()
    public var posters = [ImageMDB]()
    public var stills = [ImageMDB]()
    public var id: Int!

    public init(results: JSON) {
        id = results["id"].int
        if results["backdrops"].count > 0 {
            backdrops = ImageMDB.initialize(json: results["backdrops"])
        }
        if results["posters"].count > 0 {
            posters = ImageMDB.initialize(json: results["posters"])
        }

        if results["stills"].count > 0 {
            stills = ImageMDB.initialize(json: results["stills"])
        }
    }

}
