//
//  Client_Companies.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

extension Client{
  
  static func Company(_ api_key: String!, companyId: Int!, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    let url = "https://api.themoviedb.org/3/company/" + String(companyId)
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
  static func Company(_ api_key: String!, companyId: Int!, language: String?, page: Int?, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    let url = "https://api.themoviedb.org/3/company/" + String(companyId) + "/movies"
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
}
