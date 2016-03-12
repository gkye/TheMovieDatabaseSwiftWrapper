//
//  CreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON



struct Credits_Episodes{
    var air_date: String!
    var episode_number: Int!
    var overview: String!
    var season_number: Int!
    var still_path: String?
    init(episodes: JSON){
        air_date = episodes["air_date"].string
        episode_number = episodes["episode_number"].int
        overview = episodes["overview"].string
        season_number = episodes["season_number"].int
        still_path = episodes["still_path"].string
    }
}
struct Credits_Seasons{
    var air_date: String!
    var poster_path: String!
    var season_number: Int!
    init(seasons: JSON){
        air_date = seasons["air_date"].string
        poster_path = seasons["poster_path"].string
        season_number = seasons["season_number"].int
    }
}


struct Credits_Media{
    var id: Int!
    var name: String!
    var original_name: String!
    var character: String!
    var episodes = [Credits_Episodes]()
    var seasons = [Credits_Seasons]()
    init(media: JSON){
        id = media["id"].int
        name = media["name"].string
        original_name = media["original_name"].string
        character = media["character"].string
        
        if(media["episodes"].count > 0){
            for episode in media["episodes"]{
                episodes.append(Credits_Episodes.init(episodes: episode.1))
            }
        }
        
        if(media["seasons"].count > 0){
            for(var i = 0; i < media["seasons"].count; i++ ){
                seasons.append(Credits_Seasons.init(seasons: media["seasons"][i]))
                
            }
        }
    }
}

class CreditsMDB{
    
    var credit_type: String!
    var department: String!
    var job: String!
    var media: Credits_Media!
    var media_Type: String!
    var id: String!
    var person: (name: String!, id: Int!)
    init(credits: JSON){
        credit_type = credits["credit_type"].string
        department = credits["department"].string
        job = credits["job"].string
        
        media = Credits_Media.init(media: credits["media"])
        
        media_Type = credits["media_type"].string
        id = credits["id"].string
        person = (name: credits["person"]["name"].string, id: credits["person"]["id"].int)
    }
    
    ///Get the detailed information about a particular credit record. This is currently only supported with the new credit model found in TV. These ids can be found from any TV credit response as well as the tv_credits and combined_credits methods for people. The episodes object returns a list of episodes and are generally going to be guest stars. The season array will return a list of season numbers.
    class func credits(apiKey: String, creditID: String, language: String, completion: (clientReturn: ClientReturn, data: CreditsMDB?) -> ()) -> (){
        Client.Credits(apiKey, creditID: creditID, language: language){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: CreditsMDB.init(credits: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
}