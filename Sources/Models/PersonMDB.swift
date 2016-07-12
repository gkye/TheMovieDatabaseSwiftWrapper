//
//  PeopleMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

///TODO: popular, taggedImages, tv & movies credits
import Foundation

//MARK: Movie Crew & TV Crew common
public class PersonCrewCommon: ArrayObject{
  public var poster_path: String?
  public var credit_id: String!
  public var department: String!
  public var id: Int!
  public var job: String!
  
  required public init(results: JSON){
    poster_path = results["poster_path"].string
    credit_id = results["credit_id"].string
    department = results["department"].string
    id = results["id"].int
    job = results["job"].string
  }
}

//MARK: Movie Crew
public class PersonMovieCrew: PersonCrewCommon{
  public var adult: Bool!
  public var original_title: String!
  public var release_date: String!
  public var title: String!
  required public init(results: JSON){
    super.init(results: results)
    adult = results["adult"].bool
    original_title = results["original_title"].string
    release_date = results["release_date"].string
    title = results["title"].string
  }
}

//MARK: TV Crew
public class PersonTVCrew: PersonCrewCommon{
  public var episode_count: Int!
  public var first_air_date: String!
  public var name: String!
  public var original_name: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    episode_count = results["episode_count"].int
    first_air_date = results["first_air_date"].string
    name = results["name"].string
    original_name = results["original_name"].string
  }
}


public class PersonMovieTVCastCommon: ArrayObject{
  public var poster_path: String?
  public var credit_id: String!
  public var id: Int!
  public var character: String!
  required public init(results: JSON){
    poster_path = results["poster_path"].string
    credit_id = results["credit_id"].string
    id = results["id"].int
    character = results["character"].string
  }
  
}

//MARK: TV CAST
public class PersonTVCast: PersonMovieTVCastCommon{
  
  public var episode_count: Int!
  public var first_air_date: String!
  public var name: String!
  public var original_name: String!
  
  required public init(results: JSON) {
    super.init(results: results)
    episode_count = results["episode_count"].int
    first_air_date = results["first_air_date"].string
    name = results["name"].string
    original_name = results["original_name"].string
  }
}

//MARK: Movie Cast
public class PersonMovieCast: PersonMovieTVCastCommon{
  public var adult: Bool!
  public var original_title: String!
  public var release_date: String!
  public var title: String!
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
    json["crew"].forEach(){
      if $0.1["media_type"] == "tv'"{
        tvCrew.append(PersonTVCrew.init(results: $0.1))
      }else{
        movieCrew.append(PersonMovieCrew.init(results: $0.1))
      }
    }
    json["cast"].forEach(){
      if $0.1["media_type"] == "tv"{
        tvCast.append(PersonTVCast.init(results: $0.1))
      }else{
        movieCast.append(PersonMovieCast.init(results: $0.1))
      }
    }
    id = json["id"].int
    tvCredits = (tvCrew, tvCast)
    movieCredits = (movieCrew, movieCast)
  }
  
}

public class TaggedImagesCommon: Images_MDB{
  
  public var id: String!
  public var image_type: String!
  public var media_type: String!
  required public init(results: JSON) {
    super.init(results: results)
    id = results["id"].string
    image_type = results["image_type"].string
    media_type = results["media_type"].string
  }
}

public class TaggedImagesMovie: TaggedImagesCommon{
  public var media: DiscoverMovieMDB!
  public required init(results: JSON) {
    super.init(results: results)
    media = DiscoverMovieMDB.init(results: results["media"])
  }
}

public class TaggedImagesTV: TaggedImagesCommon{
  public var media: DiscoverTVMDB!
  public required init(results: JSON) {
    super.init(results: results)
    media = DiscoverTVMDB.init(results: results["media"])
  }
}

public struct TaggedImages{
  
  public var tvImages =  [TaggedImagesTV]()
  public var movieImages =  [TaggedImagesMovie]()
  public var id: Int!
  public var pageResults: PageResultsMDB!
  
  public init(json: JSON){
    id = json["id"].int
    pageResults = PageResultsMDB.init(results: json)
    json["results"].forEach(){
      if $0.1["media_type"] == "movie"{
        movieImages.append(TaggedImagesMovie.init(results: $0.1))
      }else{
        tvImages.append(TaggedImagesTV.init(results: $0.1))
      }
    }
  }
}


//MARK: Person

public struct PersonMDB: ArrayObject{
  
  public var adult: Bool!
  public var also_known_as = [String]?()
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
  public static func person_id(api_key: String!, personID: Int!, completion: (clientReturn: ClientReturn, data: PersonMDB?) ->()) ->(){
    let urlType = "\(personID)"
    Client.Person(urlType, api_key: api_key, language: nil, page: nil){
      apiReturn in
      var data: PersonMDB?
      if(apiReturn.error == nil){
        data = PersonMDB.init(results: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  
  ///Get the movie credits for a specific person id.
  public static func movie_credits(api_key: String!, personID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: PersonMovieCredits?) -> ()) ->(){
    let urlType = "\(personID)/movie_credits"
    Client.Person(urlType, api_key: api_key, language: language, page: nil){
      apiReturn in
      var data: PersonMovieCredits?
      if(apiReturn.error == nil){
        data = PersonMovieCredits.init(json: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  ///Get the TV credits for a specific person id.
  public static func tv_credits(api_key: String!, personID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: PersonTVCredits?) -> ()) ->(){
    let urlType = "\(personID)/tv_credits"
    Client.Person(urlType, api_key: api_key, language: language, page: nil){
      apiReturn in
      var data: PersonTVCredits?
      if(apiReturn.error == nil){
        data = PersonTVCredits.init(json: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  ///Get the combined (movie and TV) credits for a specific person id.
  public static func combined_credits(api_key: String!, personID: Int!, language: String?, completion: (clientReturn: ClientReturn, data: PersonCreditsCombined?) -> ()) ->(){
    let urlType = "\(personID)/combined_credits"
    Client.Person(urlType, api_key: api_key, language: language, page: nil){
      apiReturn in
      var data: PersonCreditsCombined?
      if(apiReturn.error == nil){
        data = PersonCreditsCombined.init(json: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  
  ///Get the external ids for a specific person id.
  public static func externalIDS(api_key: String!, personID: Int!, completion: (clientReturn: ClientReturn, data: ExternalIdsMDB?) -> ()) -> (){
    Client.Person("\(personID)/external_ids", api_key: api_key, language: nil, page: nil){
      apiReturn in
      var data: ExternalIdsMDB?
      if(apiReturn.error == nil){
        data = ExternalIdsMDB.init(results: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  ///Get the images for a specific person id.
  public static func images(api_key: String!, personID: Int!, completion: (client: ClientReturn, data: [Images_MDB]?) -> ()) -> (){
    Client.Person("\(personID)/images", api_key: api_key, language: nil, page: nil){
      apiReturn in
      var images: [Images_MDB]?
      if(apiReturn.error == nil){
        images = Images_MDB.initialize(json: apiReturn.json!["profiles"])
      }
      completion(client: apiReturn, data: images)
      
    }
  }
  ///Get the images that have been tagged with a specific person id. Will return all of the image results with a media object mapped for each image.
  public static func tagged_images(api_key: String!, personID: Int!, page: Int?, completion: (client: ClientReturn, data: TaggedImages?) -> ()) -> (){
    Client.Person("\(personID)/tagged_images", api_key: api_key, language: nil, page: page){
      apiReturn in
      var images: TaggedImages?
      if(apiReturn.error == nil){
        images = TaggedImages.init(json: apiReturn.json!)
      }
      completion(client: apiReturn, data: images)
    }
  }
  
  ///Get the latest person id.
  public static func latest(api_key: String!, completion: (clientReturn: ClientReturn, data: PersonMDB?) -> ()) -> (){
    Client.Person("latest", api_key: api_key, language: nil, page: nil){
      apiReturn in
      var data: PersonMDB?
      if(apiReturn.error == nil){
        data = PersonMDB.init(results: apiReturn.json!)
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  ///Get the list of popular people on The Movie Database. This list refreshes every day.
  public static func popular(api_key: String!, page: Int?, completion: (clientReturn: ClientReturn, data: [PersonResults]?) -> ()) -> (){
    Client.Person("popular", api_key: api_key, language: nil, page: page){
      apiReturn in
      var data: [PersonResults]?
      if(apiReturn.error == nil){
        data = PersonResults.initialize(json: apiReturn.json!["results"])
      }
      completion(clientReturn: apiReturn, data: data)
    }
  }
  
  
  
}