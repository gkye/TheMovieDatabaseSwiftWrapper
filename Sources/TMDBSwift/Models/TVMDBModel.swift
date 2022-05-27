//
//  TVMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class ContentRatingsMDB: Decodable {
  open  var iso_3166_1: String?
  open var rating: String?
}

open class TVMDB: DiscoverTVMDB {
  open var genres = [GenresMDB]()
}
