//
//  Client_People.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
  
  static func Person(urlType: String!, api_key: String!, language: String?, page: Int?, append_to: [String]? = nil, completion: (ClientReturn) -> ()) -> (){
    let url = "https://api.themoviedb.org/3/person/\(urlType)"
    var parameters: [String : AnyObject] = ["api_key": api_key]
    if(language != nil){ parameters["language"] = language }
    if(page != nil){parameters["page"] = page}
    if append_to != nil{
      parameters["append_to_response"] = append_to?.joinWithSeparator(",")
    }
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
}