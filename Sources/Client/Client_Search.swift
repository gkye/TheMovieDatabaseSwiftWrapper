//
//  Client_Search.swift
//  TMDBSwift
//
//  Created by piars777 on 26/05/2016.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client{
  static func Search(_ urlType: String!, api_key: String!, query: String, page: Int?, language: String?, include_adult: Bool?, year: Int?, primary_release_year: Int?, search_type: String?, first_air_date_year: String?, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject, "query": query as AnyObject]
    
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    if let include_adult = include_adult {
      parameters["include_adult"] = include_adult as AnyObject?
    }
    
    if let year = year {
      parameters["year"] = year as AnyObject?
    }
    
    if let primary_release_year = primary_release_year {
      parameters["primary_release_year"] = primary_release_year as AnyObject?
    }
    
    if let search_type = search_type {
      parameters["search_type"] = search_type as AnyObject?
    }
    
    if let first_air_date_year = first_air_date_year {
      parameters["first_air_date_year"] = first_air_date_year as AnyObject?
    }
    
    //--Alternative titles (lazy change later)
    if(urlType.contains("alternative_titles")){
      if(language != nil){
        parameters["country"] = language as AnyObject?
      }
    }
    
    let url = "https://api.themoviedb.org/3/search/" + urlType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
}
