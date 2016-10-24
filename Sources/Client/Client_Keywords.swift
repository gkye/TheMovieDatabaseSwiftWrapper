//
//  Client_Keyword.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation




extension Client{
  static func keyword(_ keywordType: String, api_key: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    let url = keywordType
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  static func keyword_movies(_ keywordType: String, api_key: String!, page: Int?, language: String?, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    let url = keywordType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
  
  
}
