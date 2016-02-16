//
//  GenresMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class GenresMDB: KeywordMDB{
    
    class func initialize(json: JSON)->[GenresMDB] {
        var genres = [GenresMDB]()
        for(var i = 0; i < json.count; i++){
            genres.append(GenresMDB(results: json[i]))
        }
        return genres
    }
    
    override init(results: JSON){
        super.init(results: results)
    }
    
    ///Get the list of tv or movie genres.
    class func genres(api_key: String!, listType: String, language: String?, completion: (ClientReturn) -> ()) -> (){
        Client.Genres(apikey, listType: listType, language: language, genreId: 0, page: nil, include_all_movies: nil, include_adult: nil, movieList: false){
            apiReturn in
            var aReturn = apiReturn
            if(aReturn.error == nil){
                aReturn.MBDBReturn = GenresMDB.initialize(aReturn.json!["genres"])
            }
            completion(aReturn)
        }
    }
    
}