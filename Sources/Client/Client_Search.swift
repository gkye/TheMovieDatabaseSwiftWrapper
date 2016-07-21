//
//  Client_Search.swift
//  TMDBSwift
//
//  Created by piars777 on 26/05/2016.
//  Copyright © 2016 George. All rights reserved.
//

import Foundation
extension Client{
  static func Search(urlType: String!, api_key: String!, query: String, page: Int?, language: String?, include_adult: Bool?, year: Int?, primary_release_year: Int?, search_type: String?, first_air_date_year: String?, completion: (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = ["api_key": api_key, "query": query]
    
    if(page != nil){
      parameters["page"] = page
    }
    
    if(language != nil){
      parameters["language"] = language
    }
    
    if let include_adult = include_adult {
      parameters["include_adult"] = include_adult ? "true" : "false"
    }
    
    if let year = year {
      parameters["year"] = year
    }
    
    if let primary_release_year = primary_release_year {
      parameters["primary_release_year"] = primary_release_year
    }
    
    if let search_type = search_type {
      parameters["search_type"] = search_type
    }
    
    if let first_air_date_year = first_air_date_year {
      parameters["first_air_date_year"] = first_air_date_year
    }
    
    //--Alternative titles (lazy change later)
    if(urlType.containsString("alternative_titles")){
      if(language != nil){
        parameters["country"] = language
      }
    }
    
    let url = "https://api.themoviedb.org/3/search/\(urlType)"
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
}