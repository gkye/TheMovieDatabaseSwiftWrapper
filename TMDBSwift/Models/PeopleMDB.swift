//
//  PeopleMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

///TODO: popular, taggedImages, tv & movies credits
import Foundation

public class PersonMDB{
    
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
    
    init(person: JSON){
        adult = person["adult"].bool
        also_known_as = person["also_known_as"].arrayObject as? [String]
        biography = person["biography"].string
        birthday = person["birthday"].string
        deathday = person["deathday"].string
        homepage = person["homepage"].string
        id = person["id"].int
        imdb_id = person["imdb_id"].string
        name = person["name"].string
        place_of_birth = person["place_of_birth"].string
        popularity = person["popularity"].int
        profile_path = person["profile_path"].string
    }
    
    ///Get the general person information for a specific id.
    public class func person_id(api_key: String!, personID: Int!, completion: (clientReturn: ClientReturn, data: PersonMDB?) ->()) ->(){
        let urlType = "\(personID)"
        Client.Person(urlType, api_key: api_key, language: nil, page: nil){
            apiReturn in
            var data: PersonMDB?
            if(apiReturn.error == nil){
                data = PersonMDB.init(person: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    ///Get the latest person id.
    public class func latest(api_key: String!, completion: (clientReturn: ClientReturn, data: PersonMDB?) -> ()) -> (){
        Client.Person("latest", api_key: api_key, language: nil, page: nil){
            apiReturn in
            var data: PersonMDB?
            if(apiReturn.error == nil){
                data = PersonMDB.init(person: apiReturn.json!)
            }
            completion(clientReturn: apiReturn, data: data)
        }
    }
    
    //FIXME: Create person tv credit class and movie tv credit
    
    //    ///Get the movie credits for a specific person id.
    //    class func movie_credits(api_key: String!, personID: Int!, language: String?, completion: (ClientReturn) ->()) ->(){
    //        let urlType = "\(personID)/movie_credits"
    //        Client.Person(urlType, api_key: api_key, language: language){
    //            apiReturn in
    //            var aReturn = apiReturn
    //            if(apiReturn.error == nil){
    //                aReturn.MBDBReturn = MovieCreditsMDB.init(results: apiReturn.json!)
    //            }
    //            completion(aReturn)
    //        }
    //    }
    //
    //    ///Get the TV credits for a specific person id.
    //    class func tv_credits(api_key: String!, personID: Int!, language: String?, completion: (ClientReturn) ->()) ->(){
    //        let urlType = "\(personID)/tv_credits"
    //        Client.Person(urlType, api_key: api_key, language: language){
    //            apiReturn in
    //            var aReturn = apiReturn
    //            if(apiReturn.error == nil){
    //                aReturn.MBDBReturn = TVCreditsMDB.init(results: apiReturn.json!)
    //            }
    //            completion(aReturn)
    //        }
    //    }
    
    ///Get the external ids for a specific person id.
  public class func externalIDS(api_key: String!, personID: Int!, completion: (clientReturn: ClientReturn, data: ExternalIdsMDB?) -> ()) -> (){
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
   public class func images(api_key: String!, personID: Int!, completion: (client: ClientReturn, data: [Images_MDB]?) -> ()) -> (){
        Client.Person("\(personID)/images", api_key: api_key, language: nil, page: nil){
            apiReturn in
            var images: [Images_MDB]?
            if(apiReturn.error == nil){
               images = Images_MDB.initialize(apiReturn.json!["profiles"])
            }
            completion(client: apiReturn, data: images)
            
        }
    }
    
    
    
    
}