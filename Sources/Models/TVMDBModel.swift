//
//  TVMDBModel.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public class Content_RatingsMDB{
    public  var iso_3166_1: String?
    public var rating: String?
    
    init(results: JSON){
        iso_3166_1 = results["iso_3166_1"].string
        rating = results["rating"].string
    }
    class func initialize(json: JSON)->[Content_RatingsMDB] {
        var contentRatings = [Content_RatingsMDB]()
        for i in 0..<json.count {
            contentRatings.append(Content_RatingsMDB(results: json[i]))
        }
        return contentRatings
    }
}

public class TVMDB: DiscoverTVMDB {
    
   public var name: String!
   public var origin_country: String!
   public var original_name: String!
   public var first_air_date: String!
   public var genreIds: [Int]?
    
    override init(results: JSON){
        super.init(results: results)
        if(results["name"] != nil){
            name = results["name"].string
        }else{
            name = ""
        }
        
        if(results["original_name"] != nil){
            original_name = results["original_name"].string
        }else{
            original_name = ""
        }
        
        let origin_country_array = results["origin_country"].arrayObject
        if(origin_country_array != nil && origin_country_array?.count > 0){
            origin_country = origin_country_array![0] as? String
        }else{
            origin_country = "";
        }
        
        if(results["genre_ids"] != nil){
            first_air_date = results["first_air_date"].string
        }else{
            first_air_date = ""
        }
        
        if(results["genre_ids"] != nil){
            genreIds = results["genre_ids"].arrayObject as? [Int]
        }
        
    }
    
    class func initialize(json: JSON)->[TVMDB] {
        var tvArray = [TVMDB]()
        for i in 0..<json.count{
            tvArray.append(TVMDB(results: json[i]))
        }
        return tvArray
    }
    
}
