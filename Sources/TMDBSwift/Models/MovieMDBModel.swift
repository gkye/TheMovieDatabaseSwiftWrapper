//
//  MovieMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class MovieMDB: DiscoverMovieMDB {
    open var genres = [GenresType]()
    public typealias GenresType = (id: Int?, name: String?)

    public required init(results: JSON) {
        super.init(results: results)
        results["genres"].forEach {
            genres.append(($0.1["id"].int, $0.1["name"].string))
        }
    }
}
