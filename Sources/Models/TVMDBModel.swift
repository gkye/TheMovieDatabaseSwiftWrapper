//
//  TVMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public class Content_RatingsMDB: ArrayObject{
    public  var iso_3166_1: String?
    public var rating: String?

    required public init(results: JSON){
        iso_3166_1 = results["iso_3166_1"].string
        rating = results["rating"].string
    }
}

public class TVMDB: DiscoverTVMDB {
    
    public var name: String!
    public var origin_country: [String]?
    public var original_name: String?
    public var first_air_date: String?
    public var genreIds: [Int]?
    public var genres = [genresType]()
    public typealias genresType = (id: Int!, name: String!)
    
    
    required public init(results: JSON){
        super.init(results: results)
        name = results["name"].string
        original_name = results["original_name"].string
        
        origin_country = results["origin_country_array"].arrayObject as? [String]
        
        results["genres"].forEach(){
            genres.append(($0.1["id"].int, $0.1["name"].string))
        }
        
        first_air_date = results["first_air_date"].string
        genreIds = results["genre_ids"].arrayObject as? [Int]
        
    }
    
}
