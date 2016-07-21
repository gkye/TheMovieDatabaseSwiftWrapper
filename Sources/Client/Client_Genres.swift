//
//  Client_Genres.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
  
  
  static func Genres(api_key: String!, listType: String, language: String?, genreId: Int, page: Double?, include_all_movies: Bool?, include_adult: Bool?, movieList: Bool?, completion: (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = ["api_key": api_key]
    var url = "";
    if(movieList == false || movieList == nil){
      url = "https://api.themoviedb.org/3/genre/\(listType)/list";
    }else{
      url = "https://api.themoviedb.org/3/genre/\(genreId)/movies";
    }
    
    if(language != nil){
      parameters["language"] = language
    }
    
    if(page != nil){
      parameters["page"] = page
    }
    if(include_all_movies != nil){
      parameters["include_all_movies"] = include_all_movies
    }
    if(include_adult != nil){
      parameters["include_adult"] = include_adult
    }
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
}