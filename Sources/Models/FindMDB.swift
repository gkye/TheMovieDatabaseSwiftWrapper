//
//  FindMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-09.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation


public enum ExternalIdTypes: String{
  
  case imdb_id;
  case freebase_mid;
  case freebase_id;
  case tvdb_id
  case tvrage_id
  case id
}

open class KnownForMovie: DiscoverMovieMDB {
  open var media_type: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    media_type = results["media_type"].string
  }
}

open class KnownForTV: DiscoverTVMDB{
  open var media_type: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    media_type = results["media_type"].string
  }
  
}

public struct PersonResults: ArrayObject{
  public var adult: Bool!
  public var id: Int!
  public var known_for: (tvShows: [KnownForTV]?, movies: [KnownForMovie]?)
  public var name: String!
  public var popularity: Double?
  public var profile_path: String?
  
  public init(results json: JSON){
    adult = json["adult"].bool
    id = json["id"].int
    name = json["name"].string
    popularity = json["popularity"].double
    profile_path = json["profile_path"].string
    var tvShows =  [KnownForTV]()
    var movies = [KnownForMovie]()
    
    for knownFor in json["known_for"]{
      if knownFor.1["media_type"] == "tv"{
        tvShows.append(KnownForTV.init(results: knownFor.1))
      }else{
        movies.append(KnownForMovie.init(results: knownFor.1))
      }
    }
    known_for = (tvShows, movies)
  }
}

public struct FindMDB{
  
  /// MARK: FindMDB all results returned are optional (Most results will return one section only
  
  public var movie_results = [MovieMDB]()
  public var person_results: [PersonResults]?
  public var tv_results =  [TVMDB]()
  public var tv_episode_results = [TVEpisodesMDB]()
  public var tv_season_results =  [TVSeasonsMDB]()
  
  public init(json: JSON){
    if(json["movie_results"].exists()){
      movie_results = MovieMDB.initialize(json: json["movie_results"])
    }
    
    if(json["tv_results"].exists()){
      tv_results = TVMDB.initialize(json: json["tv_results"])
    }
    if(json["person_results"].exists()){
      person_results = PersonResults.initialize(json: json["person_results"])
    }
    
    if(json["tv_episode_results"].exists()){
      tv_episode_results = TVEpisodesMDB.initialize(json: json["tv_episode_results"])
    }
    if(json["tv_season_results"].exists()){
      tv_season_results = TVSeasonsMDB.initialize(json: json["tv_seasons_results"])
    }
    
  }
  /**
   The find method makes it easy to search for objects in our database by an external id. For instance, an IMDB ID. This will search all objects (movies, TV shows and people) and return the results in a single response.
   */
  
  public static func find(id: String, external_source: ExternalIdTypes, completion: @escaping (_ clientReturn: ClientReturn, _ data: FindMDB?) -> ()) -> (){
    Client.Find(external_id: id, external_source: external_source.rawValue){
      apiReturn in
      var data: FindMDB?
      if let json = apiReturn.json {
        data = FindMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
}
