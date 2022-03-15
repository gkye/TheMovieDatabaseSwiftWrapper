//
//  PeopleMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

//MARK: Person

public struct PersonMDB: ArrayObject{
  
  public var adult: Bool!
  public var also_known_as: [String]?
  public var biography: String?
  public var birthday: String?
  public var deathday: String?
  public var homepage: String?
  public var id: Int!
  public var imdb_id: String?
  public var name: String!
  public var place_of_birth: String?
  public var popularity: Int!
  public var profile_path: String?
  
  public init(results: JSON){
    adult = results["adult"].bool
    also_known_as = results["also_known_as"].arrayObject as? [String]
    biography = results["biography"].string
    birthday = results["birthday"].string
    deathday = results["deathday"].string
    homepage = results["homepage"].string
    id = results["id"].int
    imdb_id = results["imdb_id"].string
    name = results["name"].string
    place_of_birth = results["place_of_birth"].string
    popularity = results["popularity"].int
    profile_path = results["profile_path"].string
  }
  
  ///Get the general person information for a specific id.
  public static func person_id(personID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMDB?) ->()) ->(){
    let urlType = String(personID)
    Client.Person(urlType,  language: nil, page: nil){
      apiReturn in
      var data: PersonMDB?
      if let json = apiReturn.json {
        data = PersonMDB(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  
  ///Get the movie credits for a specific person id.
  public static func movie_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMovieCredits?) -> ()) ->(){
    let urlType = String(personID) + "/movie_credits"
    Client.Person(urlType,  language: language, page: nil){
      apiReturn in
      var data: PersonMovieCredits?
      if let json = apiReturn.json {
        data = PersonMovieCredits(json: json)
      }
      completion(apiReturn, data)
    }
  }
  ///Get the TV credits for a specific person id.
  public static func tv_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonTVCredits?) -> ()) ->(){
    let urlType =  String(personID) + "/tv_credits"
    Client.Person(urlType,  language: language, page: nil){
      apiReturn in
      var data: PersonTVCredits?
      if let json = apiReturn.json {
        data = PersonTVCredits(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the combined (movie and TV) credits for a specific person id.
  public static func combined_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonCreditsCombined?) -> ()) ->(){
    let urlType =  String(personID) + "/combined_credits"
    Client.Person(urlType,  language: language, page: nil){
      apiReturn in
      var data: PersonCreditsCombined?
      if let json = apiReturn.json {
        data = PersonCreditsCombined(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  
  ///Get the external ids for a specific person id.
  public static func externalIDS(personID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> ()) -> (){
    Client.Person( String(personID) + "/external_ids",  language: nil, page: nil){
      apiReturn in
      var data: ExternalIdsMDB?
      if let json = apiReturn.json {
        data = ExternalIdsMDB(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the images for a specific person id.
  public static func images(personID: Int!, language: String? = nil, completion: @escaping (_ client: ClientReturn, _ data: [Images_MDB]?) -> ()) -> (){
    Client.Person( String(personID) + "/images",  language: language, page: nil){
      apiReturn in
      var images: [Images_MDB]?
      if let json = apiReturn.json?["profiles"] {
        images = Images_MDB.initialize(json: json)
      }
      completion(apiReturn, images)
      
    }
  }
  ///Get the images that have been tagged with a specific person id. Will return all of the image results with a media object mapped for each image.
  public static func tagged_images(personID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ client: ClientReturn, _ data: TaggedImagesMDB?) -> ()) -> (){
    Client.Person( String(personID) + "/tagged_images",  language: language, page: page){
      apiReturn in
      var images: TaggedImagesMDB?
      if let json = apiReturn.json {
        images = TaggedImagesMDB(json: json)
      }
      completion(apiReturn, images)
    }
  }
  
  ///Get the latest person id.
  public static func latest(language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMDB?) -> ()) -> (){
    Client.Person("latest",  language: language, page: nil){
      apiReturn in
      var data: PersonMDB?
      if let json = apiReturn.json {
        data = PersonMDB.init(results: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Get the list of popular people on The Movie Database. This list refreshes every day.
  public static func popular(page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: [PersonResults]?) -> ()) -> (){
    Client.Person("popular",  language: language, page: page){
      apiReturn in
      var data: [PersonResults]?
      if let json = apiReturn.json?["results"] {
        data = PersonResults.initialize(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Retrive data by append multiple person methods. Initlization of object has to be done manually. Exepect PersonMDB
  public static func personAppendTo(personID: Int!, append_to: [String], language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMDB?, _ json: JSON?) ->()) ->(){
    let urlType =  String(personID)
    Client.Person(urlType,  language: language, page: nil, append_to: append_to){
      apiReturn in
      var data: PersonMDB?
      if let json = apiReturn.json {
        data = PersonMDB.init(results: json)
      }
      completion(apiReturn, data, apiReturn.json)
    }
  }
}

///TODO: popular, taggedImages, tv & movies credits
import Foundation

//MARK: Movie Crew & TV Crew common
open class PersonCrewCommon: ArrayObject{
  open var poster_path: String?
  open var credit_id: String!
  open var department: String!
  open var id: Int!
  open var job: String!
  
  required public init(results: JSON){
    poster_path = results["poster_path"].string
    credit_id = results["credit_id"].string
    department = results["department"].string
    id = results["id"].int
    job = results["job"].string
  }
}

//MARK: Movie Crew
open class PersonMovieCrew: PersonCrewCommon{
  open var adult: Bool!
  open var original_title: String!
  open var release_date: String!
  open var title: String!
  required public init(results: JSON){
    super.init(results: results)
    adult = results["adult"].bool
    original_title = results["original_title"].string
    release_date = results["release_date"].string
    title = results["title"].string
  }
}

//MARK: TV Crew
open class PersonTVCrew: PersonCrewCommon{
  open var episode_count: Int!
  open var first_air_date: String!
  open var name: String!
  open var original_name: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    episode_count = results["episode_count"].int
    first_air_date = results["first_air_date"].string
    name = results["name"].string
    original_name = results["original_name"].string
  }
}


open class PersonMovieTVCastCommon: ArrayObject{
  open var poster_path: String?
  open var credit_id: String!
  open var id: Int!
  open var character: String!
  required public init(results: JSON){
    poster_path = results["poster_path"].string
    credit_id = results["credit_id"].string
    id = results["id"].int
    character = results["character"].string
  }
  
}

//MARK: TV CAST
open class PersonTVCast: PersonMovieTVCastCommon{
  
  open var episode_count: Int!
  open var first_air_date: String!
  open var name: String!
  open var original_name: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    episode_count = results["episode_count"].int
    first_air_date = results["first_air_date"].string
    name = results["name"].string
    original_name = results["original_name"].string
  }
}

//MARK: Movie Cast
open class PersonMovieCast: PersonMovieTVCastCommon{
  open var adult: Bool!
  open var original_title: String!
  open var release_date: String!
  open var title: String!
  required public init(results: JSON){
    super.init(results: results)
    adult = results["adult"].bool
    original_title = results["original_title"].string
    release_date = results["release_date"].string
    title = results["title"].string
  }
}

public struct PersonTVCredits{
  
  public var crew: [PersonTVCrew]
  public var cast: [PersonTVCast]
  public var id: Int!
  
  public init(json: JSON){
    crew = PersonTVCrew.initialize(json: json["crew"])
    cast = PersonTVCast.initialize(json: json["cast"])
    id = json["id"].int
  }
}

public struct PersonMovieCredits{
  
  public var crew: [PersonMovieCrew]
  public var cast: [PersonMovieCast]
  public var id: Int!
  init(json: JSON){
    crew = PersonMovieCrew.initialize(json: json["crew"])
    cast = PersonMovieCast.initialize(json: json["cast"])
    id = json["id"].int
  }
}

public struct PersonCreditsCombined{
  
  public var tvCredits: (crew: [PersonTVCrew]?, cast: [PersonTVCast]?)
  public var movieCredits: (crew: [PersonMovieCrew]?, cast: [PersonMovieCast]?)
  public var id: Int?
  
  public init(json: JSON){
    var tvCrew = [PersonTVCrew]()
    var tvCast = [PersonTVCast]()
    var movieCrew = [PersonMovieCrew]()
    var movieCast = [PersonMovieCast]()
    
    //Set TV and Movie crew data
    tvCrew = json["crew"].filter{$0.1["media_type"] == "tv"}.map{PersonTVCrew.init(results: $0.1)}
    
    movieCrew = json["crew"].filter{$0.1["media_type"] == "movie"}.map{PersonMovieCrew.init(results: $0.1)}
    
    //Set TV and Movie cast Data
    tvCast = json["cast"].filter{$0.1["media_type"] == "tv"}.map{PersonTVCast.init(results: $0.1)}
    movieCast = json["cast"].filter{$0.1["media_type"] == "movie"}.map{PersonMovieCast.init(results: $0.1)}
    
    id = json["id"].int
    tvCredits = (tvCrew, tvCast)
    movieCredits = (movieCrew, movieCast)
  }
  
}

public enum TaggedImageMediaMDB {
  case movie(DiscoverMovieMDB)
  case tv(DiscoverTVMDB)
}

public class TaggedImageMDB: Images_MDB {
  public var media: TaggedImageMediaMDB!
  public required init(results: JSON) {
    super.init(results: results)
    if results["media_type"] == "movie"{
      media = .movie(DiscoverMovieMDB(results: results["media"]))
    }else if results["media_type"] == "tv"{
      media = .tv(DiscoverTVMDB(results: results["media"]))
    }
  }
}

public struct TaggedImagesMDB{
  
  public var images: [TaggedImageMDB] = []
  public var id: Int!
  public var pageResults: PageResultsMDB!
  
  public init(json: JSON){
    id = json["id"].int
    pageResults = PageResultsMDB(results: json)
    images = TaggedImageMDB.initialize(json: json["results"])
  }
}

