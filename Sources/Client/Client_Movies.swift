//
//  Client_Movies.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
extension Client{
  
  static func Movies(_ urlType: String!, api_key: String!, page: Int?, language: String?, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    //--Alternative titles (lazy change later)
    if(urlType.contains("alternative_titles")){
      if(language != nil){
        parameters["country"] = language as AnyObject?
      }
    }
    
    if append_to != nil{
      parameters["append_to_response"] = append_to?.joined(separator: ",") as AnyObject?
    }
    
    
    let url = "https://api.themoviedb.org/3/movie/" + urlType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
}
