//
//  MovieDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieDetailedMDB: MovieMDB {
    struct belongstocollectionMovieMDB{
        var id: Int!
        var name: String!
        var poster_path: String!
        var backdrop_path: String!
        init(results: JSON){
            id = results["id"].int
            name = results["name"].string
            poster_path = results["poster_path"].string
            backdrop_path = results["backdrop_path"].string
            
        }
    }
    struct spokenLanguages{
        var iso_639_1: String!
        var name: String!
        init(results: JSON){
            iso_639_1 = results["iso_639_1"].string
            name = results["name"].string
        }
    }
    var belongs_to_collection: belongstocollectionMovieMDB!
    var budget: Int!
    var genres = [KeywordsMDB]()
    var homepage: String!
    var imdb_id: Int!
    var production_companies = [KeywordsMDB]()
    var production_countries = [KeywordsMDB]()
    var revenue : Int!
    var runtime: Int!
    var spoken_languages = [spokenLanguages]()
    var status: String!
    var tagline: String!
    
    override init(results: JSON) {
        super.init(results: results)
        if(results["belong_to_collection"] != nil){
            belongs_to_collection = belongstocollectionMovieMDB(results: results["belong_to_collection"])
        }
        budget = results["budget"].int
        
        if(results["genres"] != nil){
            for(var i = 0; i < results["genres"].count; i++ ){
                genres.append(KeywordsMDB.init(results: results["genres"][i]))
            }
        }
        if(results["homepage"] != nil){
            homepage = results["homepage"].string
        }else{
            homepage = "";
        }
        imdb_id = results["imdb_id"].int
        
        if(results["production_companies"] != nil){
            for(var i = 0; i < results["production_companies"].count; i++ ){
                production_companies.append(KeywordsMDB.init(results: results["production_companies"][i]))
            }
        }
        
        if(results["production_countries"] != nil){
            for(var i = 0; i < results["production_countries"].count; i++ ){
                production_countries.append(KeywordsMDB.init(results: results["production_countries"][i]))
            }
        }
        revenue = results["revenue"].int
        runtime = results["runtime"].int
        
        if(results["spoken_languages"] != nil){
            for(var i = 0; i < results["spoken_languages"].count; i++ ){
                spoken_languages.append(spokenLanguages.init(results: results["spoken_languages"][i]))
            }
        }
        status = results["status"].string
        tagline = results["tagline"].string
    }
    
    
}