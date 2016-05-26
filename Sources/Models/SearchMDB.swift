//
//  SearchMDB.swift
//  TMDBSwift
//
//  Created by piars777 on 26/05/2016.
//  Copyright © 2016 George. All rights reserved.
//

import Foundation
public class SearchMDB{
    
    
    public class func movie(api_key: String!, query: String, language: String?, page: Int?, includeAdult: Bool?, year: Int?, primaryReleaseYear: Int?, completion: (clientReturn: ClientReturn, movie: [MovieMDB]?) -> ()) -> (){
        Client.Search("movie", api_key: api_key, query: query, page: page, language: language, include_adult: includeAdult, year: year, primary_release_year: primaryReleaseYear, search_type: nil, first_air_date_year: nil) { apiReturn in
            var movie = [MovieMDB]?()
            if(apiReturn.error == nil){
                if(apiReturn.json!["results"].count > 0){
                    movie = MovieMDB.initialize(json: apiReturn.json!["results"])
                }
            }
            completion(clientReturn: apiReturn, movie: movie)
        }
        
    }
    
}