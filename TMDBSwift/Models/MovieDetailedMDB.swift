//
//  MovieDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public class MovieDetailedMDB: MovieMDB {
   public struct belongstocollectionMovieMDB{
        public var id: Int!
        public var name: String!
        public var poster_path: String!
        public var backdrop_path: String!
        init(results: JSON){
            id = results["id"].int
            name = results["name"].string
            poster_path = results["poster_path"].string
            backdrop_path = results["backdrop_path"].string
            
        }
    }
   public struct spokenLanguages{
        public var iso_639_1: String!
        public var name: String!
        init(results: JSON){
            iso_639_1 = results["iso_639_1"].string
            name = results["name"].string
        }
    }
    public var belongs_to_collection: belongstocollectionMovieMDB!
    public var budget: Int!
    public var genres = [KeywordsMDB]()
    public var homepage: String!
    public var imdb_id: Int!
    public var production_companies = [KeywordsMDB]()
    public var production_countries = [KeywordsMDB]()
    public var revenue : Int!
    public var runtime: Int!
    public var spoken_languages = [spokenLanguages]()
    public var status: String!
    public var tagline: String!
    
    override init(results: JSON) {
        super.init(results: results)
        if(results["belong_to_collection"] != nil){
            belongs_to_collection = belongstocollectionMovieMDB(results: results["belong_to_collection"])
        }
        budget = results["budget"].int
        
        if(results["genres"] != nil){
            for i in 0...results["genres"].count {
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
            for i in 0...results["production_companies"].count{
                production_companies.append(KeywordsMDB.init(results: results["production_companies"][i]))
            }
        }
        
        if(results["production_countries"] != nil){
            for i in 0...results["production_countries"].count{
                production_countries.append(KeywordsMDB.init(results: results["production_countries"][i]))
            }
        }
        revenue = results["revenue"].int
        runtime = results["runtime"].int
        
        if(results["spoken_languages"] != nil){
            for i in 0...results["spoken_languages"].count{
                spoken_languages.append(spokenLanguages.init(results: results["spoken_languages"][i]))
            }
        }
        status = results["status"].string
        tagline = results["tagline"].string
    }
    
    
}