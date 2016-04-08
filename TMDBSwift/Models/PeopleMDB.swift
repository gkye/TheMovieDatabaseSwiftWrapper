//
//  PeopleMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

///TODO: popular, taggedImages, tv & movies credits
import Foundation


class PersonMDB{
    
    var adult: Bool!
    var also_known_as = [String]?()
    var biography: String?
    var birthday: String?
    var deathday: String?
    var homepage: String?
    var id: Int!
    var imdb_id: String?
    var name: String!
    var place_of_birth: String?
    var popularity: Int!
    var profile_path: String?
    
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
    class func person_id(api_key: String!, personID: Int!, completion: (ClientReturn) ->()) ->(){
     let urlType = "\(personID)"
        Client.Person(urlType, api_key: api_key, language: nil, page: nil){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = PersonMDB.init(person: apiReturn.json!)
            }
            completion(aReturn)
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
    class func externalIDS(api_key: String!, personID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.Person("\(personID)/external_ids", api_key: api_key, language: nil, page: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = ExternalIdsMDB.init(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the images for a specific person id.
    class func images(api_key: String!, personID: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.Person("\(personID)/images", api_key: api_key, language: nil, page: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = Images_MDB.initialize(aReturn.json!["profiles"])
            }
            completion(aReturn)
        }
    }
    
    ///Get the latest person id.
    class func latest(api_key: String!, completion: (ClientReturn) -> ()) -> (){
        Client.Person("latest", api_key: api_key, language: nil, page: nil){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = PersonMDB.init(person: apiReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    
    
}