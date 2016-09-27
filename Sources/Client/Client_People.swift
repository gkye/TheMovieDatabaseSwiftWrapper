//
//  Client_People.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

extension Client{
  
  static func Person(_ urlType: String!, api_key: String!, language: String?, page: Int?, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> ()) -> (){
    let url = "https://api.themoviedb.org/3/person/" + urlType
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    if(language != nil){ parameters["language"] = language as AnyObject? }
    if(page != nil){parameters["page"] = page as AnyObject?}
    if append_to != nil{
      parameters["append_to_response"] = append_to?.joined(separator: ",") as AnyObject?
    }
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
}
